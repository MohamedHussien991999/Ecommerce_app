import 'package:ecommerce_application/model/cart_product_model.dart';

class OrderModel {
  String? userId, dataTime;
  Address? address;
  List<CartProductModel>? products;
  OrderModel({
    this.userId,
    this.dataTime,
    this.address,
    this.products,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    dataTime = json['dataTime'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = <CartProductModel>[];
      json['products'].forEach((v) {
        products!.add(CartProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['dataTime'] = dataTime;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? street1, street2, city, state, zipCode, country;

  Address(
      {this.street1,
      this.street2,
      this.city,
      this.state,
      this.zipCode,
      this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['street1'] = street1;
    data['street2'] = street2;
    data['city'] = city;
    data['state'] = state;
    data['zipCode'] = zipCode;
    data['country'] = country;
    return data;
  }
}
