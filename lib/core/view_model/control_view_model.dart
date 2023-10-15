import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../view/cart_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  Widget _currentScreen = const HomeView();
  get currentScreen => _currentScreen;

  ControlViewModel() {
    _currentScreen = const HomeView();
  }

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = const HomeView();
          break;
        }

      case 1:
        {
          _currentScreen = const CartView();
          break;
        }

      case 2:
        {
          _currentScreen = const ProfileView();
          break;
        }
    }

    update();
  }
}
