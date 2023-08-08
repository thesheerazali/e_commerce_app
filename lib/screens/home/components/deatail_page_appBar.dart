import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Data/data.dart';

class DetailPageAppBar extends StatefulWidget {
  const DetailPageAppBar({
    super.key,
  });

  @override
  State<DetailPageAppBar> createState() => _DetailPageAppBarState();
}

class _DetailPageAppBarState extends State<DetailPageAppBar> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavProvider>(context);
    final data = provider.productModelsget;

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
        Consumer<FavProvider>(
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 228, 228),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: IconButton(
              onPressed: () {
              //  value.addFav(data[])
              },
              icon: value.productModelsget.isEmpty
                  ? const Icon(
                      Icons.favorite_sharp,
                    )
                  : const Icon(
                      Icons.favorite_sharp,
                      color: Colors.red,
                    ),
            )),
          ),
        ),
      ],
    );
  }
}
