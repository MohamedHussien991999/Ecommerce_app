import 'package:ecommerce_application/core/service/home_services.dart';
import 'package:ecommerce_application/model/category_model.dart';
import 'package:ecommerce_application/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List <ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];


  HomeViewModel() {
    getCategories();
    getBestSellingProducts();
  }

  getCategories() async {
    try {
      _loading.value = true;
      HomeService().getCategories().then((value) {
        for (var i = 0; i < value.length; i++) {
          _categoryModel.add(CategoryModel.fromJson(
              value[i].data() as Map<String, dynamic>?));
              _loading.value = false;
        }
        update();
      });
    } catch (e) {
      Get.snackbar(
        'Error while loading categories',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  getBestSellingProducts() async {
    try {
      _loading.value = true;
      HomeService().getBestSelling().then((value) {
        for (var i = 0; i < value.length; i++) {
          _productModel.add(ProductModel.fromJson(
              value[i].data() as Map<String, dynamic>));
              _loading.value = false;
        }
        update();
      });
    } catch (e) {
      Get.snackbar(
        'Error while loading categories',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

 
}
