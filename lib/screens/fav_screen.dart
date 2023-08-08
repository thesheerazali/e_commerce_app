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
              onTap: () {
                if (provider.productModels.contains(data[index])) {
                  provider.removeFav(data[index], index);
                } else {
                  provider.addFav(data[index], index);
                }
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
