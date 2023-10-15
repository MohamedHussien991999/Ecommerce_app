import 'package:ecommerce_application/core/view_model/auth_view_model.dart';
import 'package:ecommerce_application/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? LoginView()
          : GetBuilder<ControlViewModel>(
            
              init: ControlViewModel(),
            builder: (controller) {

              return Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              );
            });
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
    
      builder: (controller) => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  "assets/images/Icon_Explore.png",
                  width: 30,
                  height: 30,
                ),
              ),
              label: "",
              backgroundColor: Colors.grey.shade200,
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  "assets/images/Icon_Cart.png",
                  width: 30,
                  height: 30,
                ),
              ),
              label: "",
              backgroundColor: Colors.grey.shade200,
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Account",
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  "assets/images/Icon_User.png",
                  width: 30,
                  height: 30,
                ),
              ),
              label: "",
              backgroundColor: Colors.grey.shade200,
            ),
          ],
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade50,
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          }),
    );
  }
}
