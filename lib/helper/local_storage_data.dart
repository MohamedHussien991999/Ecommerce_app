// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:ecommerce_application/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/constant.dart';

class LocalStorageData extends GetxController {

  
  Future<UserModel?> get getUser async {
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(CACHED_USER_DATA, jsonEncode(userModel));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
