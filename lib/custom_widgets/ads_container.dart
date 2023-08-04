import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsContainer extends StatefulWidget {
  const AdsContainer({super.key});

  @override
  State<AdsContainer> createState() => _AdsContainerState();
}

class _AdsContainerState extends State<AdsContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black,
        elevation: 10,
        child: Container(
          height: size.height * .20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage("assets/images/sale.webp"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
