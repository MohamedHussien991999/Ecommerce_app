import 'package:ecommerce_application/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name;
  String? description;
  String? image;
  String? price;
  Color? color;
  String? sized;
  String? productId;

  ProductModel({
    this.name,
    this.description,
    this.image,
    this.price,
    this.color,
    this.sized,
    this.productId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    color = HexColor.fromHex(json['color']);
    sized = json['sized'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'color': color,
      'sized': sized,
      'productId': productId,
    };
  }
}
