import 'package:ecommerce_application/helper/local_storage_data.dart';
import 'package:ecommerce_application/model/user_model.dart';
import 'package:ecommerce_application/view/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

   UserModel? get userModel => _userModel;
  UserModel? _userModel;

  ValueNotifier <bool> get loading => _loading;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      FirebaseAuth.instance.signOut();
      localStorageData.deleteUser();
      Get.offAll(LoginView());
    } catch (e) {
      Get.snackbar(
        'Error SignOut account',
        e.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  
  void getCurrentUser() async{
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
      _loading.value = false;
      update();
    });
  }
}
