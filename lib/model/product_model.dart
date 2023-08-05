import 'package:flutter/material.dart';

class ProductModel {
  int id;
  String image;
  String title;
  String type;
  String description;
  double price;
  Icon icon;
  ProductModel(
      this.id, this.image, this.title, this.type, this.description, this.price,this.icon);
}
