
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
    final data = provider.productModels;

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
                onPressed: () {
                  provider.fav(data[index], index);

                  // print(provider.isExit(data, index));
                },
                icon: provider.isExit(data[index],)
                    ? const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                      ),
              ));
        },
      ),
    );
  }
}
