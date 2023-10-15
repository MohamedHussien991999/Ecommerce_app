class CategoryModel {
  late String name;
  late String image;

  CategoryModel({required this.name, required this.image});

  CategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    name = json['name'] ?? "";
    image = json['image'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
      };
}

