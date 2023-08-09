


import 'dart:ffi';

class ProductModel {
  int id;
  String image;
  String title;
  String type;
  String description;
  int sale;
  double price;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.type,
    required this.description,
    required this.sale,
    required this.price,
  });

  void add(ProductModel productModels) {}
}
