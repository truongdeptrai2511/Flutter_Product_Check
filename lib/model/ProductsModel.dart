import 'dart:convert';

class ProductsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Object? rating;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> obj) {
    return ProductsModel(
        id: obj['id'],
        title: obj['title'],
        price: obj['price'],
        description: obj['description'],
        category: obj['category'],
        image: obj['image'],
        rating: obj['rating']);
  }
}
