import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../provider/local_db__cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Cart Items",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Consumer<LocalDBCartProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.getcartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .06, vertical: size.width * .02),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                        //<-- SEE HERE
                        side: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 231, 228, 228),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xff6ae792),
                        backgroundImage:
                            AssetImage(value.getcartItems[index].image),
                      ),
                      title: Text(value.getcartItems[index].title),
                      subtitle: Text(value.getcartItems[index].title),
                      trailing: IconButton(
                        onPressed: () {
                          value.deleteItem(index);

                          value.fetchAllContacts();
                        },
                        icon: Icon(Icons.remove_circle),
                        color: Colors.red,
                      )),
                );
              },
            ),
          )),
    );
  }
}
