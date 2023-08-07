// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductModel {
  int id;
  Image image;
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
}
