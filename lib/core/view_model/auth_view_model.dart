// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/core/service/filestore_user.dart';
import 'package:ecommerce_application/helper/local_storage_data.dart';
import 'package:ecommerce_application/model/user_model.dart';
import 'package:ecommerce_application/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name;
  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
    print('AuthViewModel is created');
  }

  @override
  void onReady() {
    super.onInit();
    print('AuthViewModel is ready');
  }

  @override
  void onClose() {
    super.onInit();
    print('AuthViewModel is closed');
  }

  void googleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await _auth.signInWithCredential(credential).then((value) async {
        await saveUser(value);
        Get.snackbar(
          'Success login account',
          'Success login account',
          colorText: Colors.black,
          backgroundColor: Colors.greenAccent,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAll(() => const ControlView());
      });
    } catch (error) {
      print(error.toString());
    }
  }

  void signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile']);

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      await _auth.signInWithCredential(facebookAuthCredential).then((value) {
        saveUser(value);
      });
    } catch (error) {
      print(error.toString());
    }
    // Trigger the sign-in flow
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUserData(value.user!.uid);
      });
      Get.snackbar(
        'Success login account',
        'Success login account',
        colorText: Colors.black,
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAll(() => const ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        saveUser(value);
      });

      Get.snackbar(
        'Success Register account',
        'Success Register account',
        colorText: Colors.black,
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(() => const ControlView());
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error create Account',
        e.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> saveUser(UserCredential user) async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((value) async {
      for (var element in value.docs) {
        if (element['userId'] == user.user!.uid) {
          exist = true;
          setUser(UserModel.fromJson(element.data()));
        }
      }
      if (!exist) {
        UserModel userModel = UserModel(
          userId: user.user!.uid,
          name: name ?? "",
          email: user.user!.email,
          image: '',
        );

        await FireStoreUser().addUserToFireStore(userModel);
        setUser(userModel);
      }
    });
  }

  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()! as Map<String, dynamic>?));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
