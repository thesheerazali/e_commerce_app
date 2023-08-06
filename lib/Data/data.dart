import 'package:flutter/material.dart';

import '../model/product_model.dart';

class Data {
  static List<ProductModel> generateProducts() {
    return [
      ProductModel(
        1,
        "assets/images/women4.jpg",
        "Black OutFit",
        "Outer",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        99.56,
        const Icon(Icons.favorite_border_outlined),
      ),
      ProductModel(
        2,
        "assets/images/women2.jpg",
        "Yellow OutFit",
        "Casual",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        137.56,
        const Icon(Icons.favorite_border_outlined),
      ),
      ProductModel(
        3,
        "assets/images/women3.jpg",
        "Cyan OutFit",
        "Party",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        99.56,
        const Icon(Icons.favorite_border_outlined),
      ),
      ProductModel(
        4,
        "assets/images/women1.jpg",
        "Blue OutFit",
        "Event",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
