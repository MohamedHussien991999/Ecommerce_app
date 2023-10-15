class UserModel {
  String? name, userId, email, image;
  UserModel({this.name, this.userId, this.email, this.image});

  UserModel.fromJson(Map<String, dynamic>? json) {
    if(json == null) return;

    name = json['name'];
    userId = json['userId'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId, 
      'email': email,
      'image': image,
    };
  }
}
