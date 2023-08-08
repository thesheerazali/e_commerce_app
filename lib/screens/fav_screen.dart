import 'package:e_commerce_app/floor_database/database.dart';
import 'package:e_commerce_app/floor_database/entity.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/fav_provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavProvider>(context);
    final data = provider.productModelsget;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favriotes"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () async {
                provider.addFav(data[index], index);

                final database = await $FloorProductDatabase
                    .databaseBuilder('product_database.db')
                    .build();
                final Product product = Product(1, "Title", "Des");
                print('-------------------------------------------------');
                database.productDao.insertProduct(product);
                print(
                    '-------------------------------------------------After insertion');
              },
              shape: RoundedRectangleBorder(
                //<-- SEE HERE
                side: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xff6ae792),
                backgroundImage: data[index].image.image,
              ),
              title: Text(data[index].title),
              subtitle: const Text('Item description'),
              trailing: Icon(
                provider.productModels.contains(data[index])
                    ? Icons.remove_circle
                    : Icons.favorite_border_outlined,
              ));
        },
      ),
    );
  }
}
