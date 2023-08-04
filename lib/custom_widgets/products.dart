import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsVeiw extends StatefulWidget {
  const ProductsVeiw({super.key});

  @override
  State<ProductsVeiw> createState() => _ProductsVeiwState();
}

class _ProductsVeiwState extends State<ProductsVeiw> {
  static List mainProfileImages = [
    "assets/images/pic.jpg",
    "assets/images/pic1.jpg",
    "assets/images/pic2.jpg",
    "assets/images/pic3.jpg",
    "assets/images/pic4.jpg",
    "assets/images/pic5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        itemCount: 6,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              //  height: size.height * .5,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(
                      mainProfileImages[index],
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
          );
        },
      ),
    );
  }
}
