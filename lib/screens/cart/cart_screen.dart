import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db/entity/product.dart';
import '../../db/services/localdb_services.dart';
import '../../provider/text_field_controller_provider.dart';
import '../favorite/fav_page_app_bar.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // late Stream<List<Product>> productListStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCartItems();
  }

  Future<List<Product>> fetchCartItems() async {
    final value = Provider.of<TextFieldsControllers>(context, listen: false);
    List<Product> productListStream = await (await LocalDbService.productDao)
        .getCartProductsForUser(true, value.emailControllerForLogin.text);

    return productListStream;
  }

  Future<Product?> getProductById(int id) async {
    Product? product =
        await (await LocalDbService.productDao).getProductById(id);

    return product;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffe6d29),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .06,
          ),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            FavPageAppBar(title: "Cart Items"),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Product>>(
              future: fetchCartItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading Cart items'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Cart items available'));
                } else {
                  final favoriteItems = snapshot.data;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: favoriteItems!.length,
                      itemBuilder: (context, index) {
                        final favoriteItem = favoriteItems[index];
                        return FutureBuilder<Product?>(
                          future: getProductById(favoriteItem.id!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox.shrink();
                            } else if (snapshot.hasError ||
                                snapshot.data == null) {
                              return SizedBox.shrink();
                            } else {
                              final product = snapshot.data!;
                              return ListTile(
                                  shape: RoundedRectangleBorder(
                                    //<-- SEE HERE
                                    side: const BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 231, 228, 228),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  leading: ClipPath(
                                    clipper: const ShapeBorderClipper(
                                        shape: CircleBorder()),
                                    // clipBehavior: Clip.hardEdge,
                                    child: product.image.startsWith('assets/')
                                        ? Image(
                                            image: AssetImage(product.image),
                                            fit: BoxFit.fill,
                                          )
                                        : Image(
                                            image:
                                                FileImage(File(product.image)),
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                  title: Text(
                                    product.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 231, 228, 228),
                                    ),
                                  ),
                                  subtitle: Text(
                                    product.type,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 231, 228, 228),
                                        fontSize: 16),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        product.isInCart = false;
                                      });

                                      (await LocalDbService.productDao)
                                          .updateProduct(product);

                                      setState(() {});

                                      // await (await LocalDbService.favDao)
                                      //     .deleteFavoriteItemByProductId(
                                      //         product.id!);
                                    },
                                    icon: const Icon(Icons.remove_circle),
                                    color: const Color.fromARGB(
                                        255, 231, 228, 228),
                                  ));
                            }
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _removeCart(BuildContext context, Product product) async {
    final value = Provider.of<TextFieldsControllers>(context, listen: false);
    final user = await (await LocalDbService.usersDao)
        .getEmailByEmail(value.emailControllerForLogin.text);

    // Toggle favorite status and update in database
    product.isFavorite = false;
    await (await LocalDbService.productDao).updateProduct(product);
    fetchCartItems();

    // Remove favorite item from favorite_items table

    await (await LocalDbService.cartDao).removeCartItem(product.id!, user!);
    fetchCartItems();
    setState(() {});
  }
}
