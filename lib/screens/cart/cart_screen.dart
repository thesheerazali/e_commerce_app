import 'package:e_commerce_app/db/entity/cart.dart';
import 'package:e_commerce_app/provider/local_db_fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db/services/localdb_services.dart';
import '../../provider/local_db__cart_provider.dart';
import '../favorite/fav_page_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<List<Cart>> datafectFromEmail() async {
    // var emails = await (await LocalDbService.usersDao)
    //     .getEmailByEmail(emailController.text);
    var value = Provider.of<LocalDBFavProvider>(context);

    var valueCart = Provider.of<LocalDBCartProvider>(context);

    var email = await (await LocalDbService.cartDao)
        .getCartForUser(value.emailController.text);

    valueCart.fetchAllDataofCart();

    return email;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   centerTitle: true,
          //   title: const Text(
          //     "Cart Items",
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 24,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          body: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const FavPageAppBar(),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List<Cart?>>(
                future: datafectFromEmail(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text('User not found.');
                  } else {
                    final email = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * .02),
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
                                      AssetImage(email[index]!.image),
                                ),
                                title: Text(email[index]!.title),
                                subtitle: Text(email[index]!.title),
                                trailing: IconButton(
                                  onPressed: () {
                                    var value =
                                        Provider.of<LocalDBCartProvider>(
                                            context,
                                            listen: false);

                                    Cart cart = Cart(
                                        uid: email[index]!.uid,
                                        productId: email[index]!.productId,
                                        title: email[index]!.title,
                                        type: email[index]!.type,
                                        image: email[index]!.image,
                                        price: email[index]!.price,
                                        quaintity: email[index]!.quaintity);
                                    value.deleteItem(cart);

                                    value.fetchAllDataofCart();
                                  },
                                  icon: Icon(Icons.remove_circle),
                                  color: Colors.red,
                                )),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          )),
    );
  }
}
