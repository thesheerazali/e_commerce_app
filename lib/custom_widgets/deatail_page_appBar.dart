import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPageAppBar extends StatefulWidget {
  const DetailPageAppBar({super.key});

  @override
  State<DetailPageAppBar> createState() => _DetailPageAppBarState();
}

class _DetailPageAppBarState extends State<DetailPageAppBar> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 228, 228),
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        const Text(
          "Product Detail",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 228, 228),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          )),
        ),
      ],
    );
  }
}
