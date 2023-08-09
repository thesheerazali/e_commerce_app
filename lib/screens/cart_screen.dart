import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../db/entity/cart.dart';
import '../db/services/localdb_services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> contacts = [];

  @override
  void initState() {
    super.initState();
    fetchAllContacts();
  }

  fetchAllContacts() async {
    contacts = await (await LocalDbService.contactDao).getAllCartData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
              shape: RoundedRectangleBorder(
                //<-- SEE HERE
                side: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xff6ae792),
                backgroundImage: AssetImage(contacts[index].image),
              ),
              title: Text(contacts[index].title),
              subtitle:  Text(contacts[index].title),
              trailing: IconButton(
                onPressed: () {},
                 
                icon: Icon(Icons.remove_circle),
                color: Colors.red,
              ));
        },
      ),
    );
  }
}
