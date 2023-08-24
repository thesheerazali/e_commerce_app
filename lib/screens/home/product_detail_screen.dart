// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:readmore/readmore.dart';

import '../../db/entity/cart.dart';
import '../../db/entity/product.dart';
import '../../db/services/localdb_services.dart';
import '../../provider/text_field_controller_provider.dart';
import 'home_custom_widget/deatail_page_appBar.dart';
import 'home_custom_widget/detail_page_pictureVeiw.dart';

class DetailPage extends StatefulWidget {
  final List<Product> products;
  final int index;
  const DetailPage({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    // getProductById();
  }

  // Future<List<Product>> getProductById() async {
  //   return await (await LocalDbService.productDao)
  //       .getProductsByCategoryId(widget.categoryId);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: detailPageBottomNavigationBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffe6d29),
                Color(0xffff9305),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const DetailPageAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: widget.products[widget.index].image
                            .startsWith('assets/')
                        ? Image(
                            height: size.height * .40,
                            width: double.infinity,
                            image:
                                AssetImage(widget.products[widget.index].image),
                            fit: BoxFit.fill,
                          )
                        : Image(
                            height: size.height * .40,
                            width: double.infinity,
                            image: FileImage(
                                File(widget.products[widget.index].image)),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .025),
                          child: Text(
                            widget.products[widget.index].type,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .025),
                          child: Text(
                            widget.products[widget.index].title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .013,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "Save ${widget.products[widget.index].discount}%",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  )),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 245, 234, 133),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.3",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("(356 Reveiws)"),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .013,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .025),
                          child: const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .013,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * .025),
                          child: ReadMoreText(
                            widget.products[widget.index].description,
                            trimLines: 3,
                            preDataTextStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            colorClickableText: Colors.black,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Show more',
                            trimExpandedText: ' show less',
                          ),
                        ),
                        SizedBox(
                          height: size.height * .013,
                        ),
                        SelectPicture(
                            productData: widget.products, index: widget.index),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget detailPageBottomNavigationBar() {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      height: size.height * .08,
      color: const Color(0xfffe6d29),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .075),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  Text(
                    widget.products[widget.index].price.toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .060,
              width: size.width * .35,
              child: ElevatedButton(
                onPressed: () async {
                  final pro = Provider.of<TextFieldsControllers>(context,
                      listen: false);

                  if (widget.products[widget.index].isInCart != true) {
                    widget.products[widget.index].isInCart = true;
                    await (await LocalDbService.cartDao).insertCartItem(Cart(
                        id: null,
                        productId: widget.products[widget.index].id!,
                        userEmail: pro.emailControllerForLogin.text,
                        quantity: 1));
                    await (await LocalDbService.productDao)
                        .updateProduct(widget.products[widget.index]);
                  } else {
                    widget.products[widget.index].isInCart = false;
                    await (await LocalDbService.cartDao).removeCartItem(
                        widget.products[widget.index].id!,
                        pro.emailControllerForLogin.text);
                    await (await LocalDbService.productDao)
                        .updateProduct(widget.products[widget.index]);
                  }

                  setState(() {});
                  // final productDao = await LocalDbService.productDao;
                  // // final favoriteItemDao = await LocalDbService.favDao;

                  // if (widget.products[widget.index].isInCart) {
                  //   // Remove from favorites

                  //   widget.products[widget.index].isInCart = false;

                  //   await productDao
                  //       .updateProduct(widget.products[widget.index]);
                  //   // await (favoriteItemDao)
                  //   //     .deleteFavoriteItemByProductId(
                  //   //         products[index].id!);
                  // } else {
                  //   // Add to favorites

                  //   widget.products[widget.index].isInCart = true;

                  //   await productDao
                  //       .updateProduct(widget.products[widget.index]);
                  // }
                  // setState(() {});

                  // final updatedProducts = await productDao
                  //     .getProductsByCategoryId(widget.categoryId);
                  // setState(() {
                  //   products.clear();
                  //   products.addAll(updatedProducts);
                  // });
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                ),
                child: Text(
                  widget.products[widget.index].isInCart
                      ? "Added"
                      : "+ Add to Cart",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   void snakeBar(BuildContext context, String s) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(s),
//       ),
//     );
//   }
// }
}
