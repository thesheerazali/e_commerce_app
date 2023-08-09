import 'package:e_commerce_app/provider/local_db_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../db/entity/cart.dart';
import '../db/services/localdb_services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<LocalDBProvider>(context, listen: false).fetchAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider2 = Provider.of<LocalDBProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: provider2.getcartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
              shape: RoundedRectangleBorder(
                //<-- SEE HERE
                side: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xff6ae792),
                backgroundImage:
                    AssetImage(provider2.getcartItems[index].image),
              ),
              title: Text(provider2.getcartItems[index].title),
              subtitle: Text(provider2.getcartItems[index].title),
              trailing: IconButton(
                onPressed: () {
                  provider2.deleteItem(index);

                  print("delete");
                },
                icon: const Icon(Icons.remove_circle),
                color: Colors.red,
              ));
        },
      ),
    );
  }
}
