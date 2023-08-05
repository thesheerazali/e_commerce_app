import 'package:flutter/material.dart';

import '../model/product_model.dart';

class Data {
  static List<ProductModel> generateProducts() {
    return [
      ProductModel(
        1,
        "assets/images/women4.jpg",
        "Black OutFit",
        "Men's Shoes",
        "Outer",
        99.56,
        const Icon(Icons.favorite_border_outlined),
      ),
      ProductModel(
        2,
        "assets/images/women2.jpg",
        "Yellow OutFit",
        "Casual",
        "men shoes",
        137.56,
        const Icon(Icons.favorite_border_outlined),
      ),
      ProductModel(
        3,
        "assets/images/women3.jpg",
        "Cyan OutFit",
        "Party",
        "men shoes",
        99.56,
        const Icon(Icons.favorite_border_outlined),
      ),
      ProductModel(
        4,
        "assets/images/women1.jpg",
        "Blue OutFit",
        "Event",
        "men shoes",
        212.56,
        const Icon(Icons.favorite_border_outlined),
      ),
    ];
  }

  // static List<ProductModel> generateCategories() {
  //   return [
  //     ProductModel(1, "assets/images/shoes_1.png", "Lifestyle", "Men's Shoes",
  //         "men shoes", 99.56),
  //     ProductModel(2, "assets/images/shoes_2.png", "Basketball", "Men's Shoes",
  //         "men shoes", 137.56),
  //     ProductModel(3, "assets/images/shoes_3.png", "Running", "Men's Shoes",
  //         "men shoes", 99.56),
  //     ProductModel(4, "assets/images/shoes_4.png", "Rugby", "Men's Shoes",
  //         "men shoes", 212.56),
  //   ];
  // }

  static List<String> categoryData = [
    "Recommended",
    "Shoes",
    "Shirts",
    "Coats",
    "Jeans",
    "Shoes",
  ];
}
