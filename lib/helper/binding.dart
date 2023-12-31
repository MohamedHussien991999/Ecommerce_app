import 'package:ecommerce_application/core/view_model/auth_view_model.dart';
import 'package:ecommerce_application/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_application/core/view_model/control_view_model.dart';
import 'package:ecommerce_application/helper/local_storage_data.dart';
import 'package:get/get.dart';
import '../core/view_model/cart_view_model.dart';
import '../core/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel(), fenix: true);
    Get.lazyPut(() => LocalStorageData(), fenix: true);
    Get.lazyPut(() => CheckOutViewModel(), fenix: true);
  }
}
