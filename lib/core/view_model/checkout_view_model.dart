import 'package:ecommerce_application/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/enum.dart';

class CheckOutViewModel extends GetxController {
  int _processIndex = 0;
  int get processIndex => _processIndex;

  Pages _pages = Pages.deliveryTime;
  Pages get pages => _pages;
  String? street1, street2, city, state, zipCode, country;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeIndex(int index) {
    _processIndex = index;
    update();
  }

  void changePages(int index) {
    if(_processIndex == 0 ){
      _processIndex = index;
      _pages = Pages.deliveryTime;
    }
    else if (_processIndex == 1) {
      _processIndex = index;
      _pages = Pages.addAddress;
    } else if (_processIndex == 2) {
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        _pages = Pages.summary;
        _processIndex = index;
      }
    } else if (_processIndex == 3) {
      Get.to(const ControlView());
      _pages = Pages.deliveryTime;
      _processIndex=0;
    }

    update();
  }
}
