import 'package:flutter/material.dart';
import 'package:floor/floor.dart';

@entity
class Cart {
  @primaryKey
  final int id;

  final String uid;
  final String image;
  final String title;
  final String type;
  final String description;
  final int sale;
  final double price;

  Cart(
      {required this.id,
      required this.image,
      required this.title,
      required this.type,
      required this.description,
      required this.sale,
      required this.price,
      required this.uid});
}
