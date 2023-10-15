
class CartProductModel {
  String? name; 
  String? image;
  String? price;
  int? quantity;
  String? productId;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  CartProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
