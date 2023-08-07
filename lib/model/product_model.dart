import 'package:flutter/material.dart';

class ProductModel {
  int id;
  Image image;
  String title;
  String type;
  String description;
  double price;
  
  ProductModel({ required this.id, required this.image, required this.title, required this.type, required this.description, required this.price,});
}
