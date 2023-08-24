// import 'package:category_examp/services/localdb_services.dart';
import 'dart:io';

import 'package:e_commerce_app/screens/home/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../db/entity/category.dart';
import '../../db/entity/fav.dart';
import '../../db/entity/product.dart';
import '../../db/services/localdb_services.dart';
import '../../provider/text_field_controller_provider.dart';
import 'home_custom_widget/ads_container.dart';
import 'home_custom_widget/home_search_motification_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PageController? pageController;

  List<Category> categories = [];

  @override
  void initState() {
    _tabController = TabController(length: 6, initialIndex: 0, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final fetchedCategories =
        await (await LocalDbService.categoryDap).getAllCategories();
    setState(() {
      categories = fetchedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: categories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const SearchNotifBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    const AdsContainer(),
                    const SizedBox(
                      height: 20,
                    ),
                    TabBar(
                        labelPadding: EdgeInsets.only(
                          right: size.width * .033,
                        ),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        unselectedLabelColor: Colors.black,
                        padding: EdgeInsets.only(left: size.width * .075),
                        isScrollable: true,
                        controller: _tabController,
                        tabs: [
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !_tabController.indexIsChanging
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              width: size.width * .35,
                              height: size.height * .065,
                              child: Center(child: Text(categories[0].name))),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !_tabController.indexIsChanging
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              width: size.width * .35,
                              height: size.height * .065,
                              child: Center(child: Text(categories[1].name))),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !_tabController.indexIsChanging
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              width: size.width * .35,
                              height: size.height * .065,
                              child: Center(child: Text(categories[2].name))),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !_tabController.indexIsChanging
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              width: size.width * .35,
                              height: size.height * .065,
                              child: Center(child: Text(categories[3].name))),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !_tabController.indexIsChanging
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              width: size.width * .35,
                              height: size.height * .065,
                              child: Center(child: Text(categories[4].name))),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !_tabController.indexIsChanging
                                        ? Colors.black
                                        : Colors.black),
                              ),
                              width: size.width * .35,
                              height: size.height * .065,
                              child: Center(child: Text(categories[5].name))),
                        ]),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .065),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            CategoryDataScreen(categoryId: categories[0].id!),
                            CategoryDataScreen(categoryId: categories[1].id!),
                            CategoryDataScreen(categoryId: categories[2].id!),
                            CategoryDataScreen(categoryId: categories[3].id!),
                            CategoryDataScreen(categoryId: categories[4].id!),
                            CategoryDataScreen(categoryId: categories[5].id!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryDataScreen extends StatefulWidget {
  final int categoryId;

  CategoryDataScreen({required this.categoryId});

  @override
  State<CategoryDataScreen> createState() => _CategoryDataScreenState();
}

class _CategoryDataScreenState extends State<CategoryDataScreen> {
  List<Product> products = [];

  Future<void> getProductById() async {
    List<Product> productss = await (await LocalDbService.productDao)
        .getProductsByCategoryId(widget.categoryId);

    //      for (final product in getProductById) {
    //   final isFavorite = (await LocalDbService.favDao).isProductInFavorites(product.id);
    //   product.isFavorite = awa isFavorite == 1; // Convert the result to a boolean
    // }

    setState(() {
      products = productss;
    });
  }

  // Future<void> toggleFavorite(Product product) async {
  //   final isCurrentlyFavorite = product.isFavorite;

  //   setState(() {
  //     product.isFavorite = isCurrentlyFavorite;
  //   });

  //   (await LocalDbService.productDao).updateProduct(product);

  //   if (isCurrentlyFavorite!) {
  //     (await LocalDbService.favDao).deleteFavoriteItemByProductId(product.id!);
  //   } else {
  //     final newFavorite = Fav(id: null, productId: product.id!);
  //     (await LocalDbService.favDao).addToFav(newFavorite);
  //   }
  // }

  Future<void> addFavoriteItem(int productId, String userEmail) async {
    final favoriteItem =
        Fav(id: null, productId: productId, userEmail: userEmail);
    await (await LocalDbService.favDao).insertFavoriteItem(favoriteItem);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getProductById();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: products.length,

      //shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: size.aspectRatio / .78,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // print(products[index].isFavorite);
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(products: products, index: index),
                  ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          products[index].image.startsWith('assets/')
                              ? Image(
                                  height: size.height * .24,
                                  width: double.infinity,
                                  image: AssetImage(products[index].image),
                                  fit: BoxFit.fill,
                                )
                              : Image(
                                  height: size.height * .24,
                                  width: double.infinity,
                                  image: FileImage(File(products[index].image)),
                                  fit: BoxFit.fill,
                                ),
                          Container(
                            margin: EdgeInsets.only(
                                left: size.width * .3, top: size.height * .010),
                            height: 16,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.red),
                            child: Center(
                                child: Text(
                              "-${products[index].discount.toString()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(products[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      Text("\$ ${products[index].price}",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Container(
                        height: size.height * .05,
                        width: size.width * .11,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 228, 228),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.favorite_sharp),
                          color: products[index].isFavorite
                              ? Colors.red
                              : Colors.black,

                          onPressed: () async {
                            final pro = Provider.of<TextFieldsControllers>(
                                context,
                                listen: false);
                            // Toggle favorite status
                            // products[index].isFavorite = !products[index].isFavorite;

                            // // Update in database
                            // await (await LocalDbService.productDao).updateProduct(products[index]);

                            // Insert or remove from favorite_items table
                            // final user = await (await LocalDbService.usersDao)
                            //     .getEmailByEmail(pro.emailController.text);

                            // if (user == pro.emailController.text) {
                            if (products[index].isFavorite != true) {
                              products[index].isFavorite = true;
                              await (await LocalDbService.favDao)
                                  .insertFavoriteItem(Fav(
                                      id: null,
                                      productId: products[index].id!,
                                      userEmail:
                                          pro.emailControllerForLogin.text));
                              await (await LocalDbService.productDao)
                                  .updateProduct(products[index]);
                            } else {
                              products[index].isFavorite = false;
                              await (await LocalDbService.favDao)
                                  .removeFavoriteItem(products[index].id!,
                                      pro.emailControllerForLogin.text);
                              await (await LocalDbService.productDao)
                                  .updateProduct(products[index]);
                            }

                            setState(() {});
                          },
                          // onPressed: () async {
                          //   // final provider = Provider.of<LocalDBFavProvider>(
                          //   //     context,
                          //   //     listen: false);
                          //   // addFavoriteItem(products[index].id!,
                          //   //     provider.emailController.text);
                          //   final productDao = await LocalDbService.productDao;
                          //   // final favoriteItemDao = await LocalDbService.favDao;

                          //   if (products[index].isFavorite) {
                          //     // Remove from favorites

                          //     products[index].isFavorite = false;

                          //     await productDao.updateProduct(products[index]);
                          //     // await (favoriteItemDao)
                          //     //     .deleteFavoriteItemByProductId(
                          //     //         products[index].id!);
                          //   } else {
                          //     // Add to favorites

                          // products[index].isFavorite = true;

                          //     await productDao.updateProduct(products[index]);
                          //   }
                          //   setState(() {});

                          //   // final updatedProducts = await productDao
                          //   //     .getProductsByCategoryId(widget.categoryId);
                          //   // setState(() {
                          //   //   products.clear();
                          //   //   products.addAll(updatedProducts);
                          //   // });
                          // },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  void snakeBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
      ),
    );
  }
}
