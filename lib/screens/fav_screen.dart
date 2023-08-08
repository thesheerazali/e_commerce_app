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
              trailing: IconButton(
                  onPressed: () async {
                    provider.addFav(
                      data[index],
                    );

                    if (provider.productModelsget.isNotEmpty) {
                      provider.isFav = true;
                    } else {
                      provider.isFav = false;
                    }

                    // final database = await $FloorProductDatabase
                    //     .databaseBuilder('product_database.db')
                    //     .build();

                    // final personDao = database.productDao;
                    // final Product product = Product(5, "Title", "Des");

                    // final result =  personDao.findPersonById(5);

                    // print('-------------------------------------------------');
                    // database.productDao.insertProduct(product);
                    // print(
                    //     '-------------------------------------------------After insertion');
                  },
                  icon: Icon(Icons.remove_circle)));
        },
      ),
    );
  }
}
