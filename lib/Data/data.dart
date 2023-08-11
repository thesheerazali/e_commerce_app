// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../model/product_model.dart';

class Data {
  static List<ProductModel> generateProductsRecommended() {
    return [
      ProductModel(
          id: 1,
          image: "assets/main/images/women4.jpg",
          title: "Black OutFit",
          type: "Outer",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 99.56,
          sale: 20),
      ProductModel(
          id: 2,
          image: "assets/main/images/women2.jpg",
          title: "Yellow OutFit",
          type: "Casual",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 137.56,
          sale: 24),
      ProductModel(
          id: 3,
          image: "assets/main/images/women3.jpg",
          title: "Cyan OutFit",
          type: "Party",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 99.56,
          sale: 40),
      ProductModel(
          id: 4,
          image: "assets/main/images/women1.jpg",
          title: "Blue OutFit",
          type: "Event",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 212.56,
          sale: 18),
    ];
  }

  static List<ProductModel> generateProductShoes() {
    return [
      ProductModel(
          id: 1,
          image: "assets/main/images/shoes1.jpg",
          title: "Black Shoes",
          type: "Event",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 99.56,
          sale: 25),
      ProductModel(
          id: 2,
          image: "assets/main/images/shoes5.jpg",
          title: "sneaker",
          type: "Casual",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 137.56,
          sale: 50),
      ProductModel(
          id: 3,
          image: "assets/main/images/shoes3.jpg",
          title: "White Shoe",
          type: "Party",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 99.56,
          sale: 60),
      ProductModel(
          id: 4,
          image: "assets/main/images/shoes4.jpg",
          title: "Jordan",
          type: "Event",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          price: 212.56,
          sale: 30),
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
