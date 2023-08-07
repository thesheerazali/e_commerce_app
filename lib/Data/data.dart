// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../screens/home_page.dart';

class Data {
  static List<ProductModel> generateProductsRecommended() {
    return [
      ProductModel(
        id: 1,
        image: const Image(image: AssetImage("assets/images/women4.jpg")),
        title: "Black OutFit",
        type: "Outer",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 99.56,
      ),
      ProductModel(
        id: 2,
        image: const Image(image: AssetImage("assets/images/women2.jpg")),
        title: "Yellow OutFit",
        type: "Casual",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 137.56,
      ),
      ProductModel(
        id: 3,
        image: const Image(image: AssetImage("assets/images/women3.jpg")),
        title: "Cyan OutFit",
        type: "Party",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 99.56,
      ),
      ProductModel(
        id: 4,
        image: const Image(image: AssetImage("assets/images/women1.jpg")),
        title: "Blue OutFit",
        type: "Event",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 212.56,
      ),
    ];
  }

  static List<ProductModel> generateProductShoes() {
    return [
      ProductModel(
        id: 1,
        image: const Image(image: AssetImage("assets/images/shoes1.jpg")),
        title: "Black Shoes",
        type: "Event",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 99.56,
      ),
      ProductModel(
        id: 2,
        image: const Image(
          image: AssetImage("assets/images/shoes5.jpg"),
        ),
        title: "Yellow OutFit",
        type: "Casual",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 137.56,
      ),
      ProductModel(
        id: 3,
        image: const Image(image: AssetImage("assets/images/shoes3.jpg")),
        title: "Cyan OutFit",
        type: "Party",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 99.56,
      ),
      ProductModel(
        id: 4,
        image: const Image(
          image: AssetImage("assets/images/shoes4.jpg"),
        ),
        title: "Blue OutFit",
        type: "Event",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        price: 212.56,
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
