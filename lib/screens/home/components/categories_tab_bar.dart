import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/provider/fav_provider.dart';
import 'package:e_commerce_app/provider/local_db_fav_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Data/data.dart';
import '../../../db/entity/cart.dart';
import '../../../db/entity/fav.dart';
import '../../../db/services/localdb_services.dart';
import '../home_detail_page.dart';

class CategorieTabBar extends StatefulWidget {
  const CategorieTabBar({
    super.key,
  });

  @override
  State<CategorieTabBar> createState() => _CategorieTabBarState();
}

class _CategorieTabBarState extends State<CategorieTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PageController? pageController;

  @override
  void initState() {
    _tabController = TabController(length: 6, initialIndex: 0, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  List cateName = Data.categoryData;

  List<ProductModel> recommendedProductData =
      Data.generateProductsRecommended();
  List<ProductModel> shoesProductData = Data.generateProductShoes();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        children: [
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
                    child: Center(child: Text(cateName[0]))),
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
                    child: Center(child: Text(cateName[1]))),
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
                    child: Center(child: Text(cateName[2]))),
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
                    child: Center(child: Text(cateName[3]))),
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
                    child: Center(child: Text(cateName[4]))),
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
                    child: Center(child: Text(cateName[5]))),
              ]),
          SizedBox(
            height: size.height * .015,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .065),
              child: TabBarView(
                controller: _tabController,
                children: [
                  getGridVeiwOfCategories(
                      size: size, data: recommendedProductData),
                  getGridVeiwOfCategories(size: size, data: shoesProductData),
                  getGridVeiwOfCategories(size: size, data: shoesProductData),
                  getGridVeiwOfCategories(size: size, data: shoesProductData),
                  getGridVeiwOfCategories(size: size, data: shoesProductData),
                  getGridVeiwOfCategories(size: size, data: shoesProductData),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getGridVeiwOfCategories(
      {required var size, required List<ProductModel> data}) {
    return GridView.builder(
      itemCount: data.length,

      //shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: size.aspectRatio / .78,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(productdata: data[index]),
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
                          Image(
                            height: size.height * .24,
                            width: double.infinity,
                            image: AssetImage(data[index].image),
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
                              "-${data[index].sale.toString()}",
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
                  child: Text(data[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ),

                // const SizedBox(
                //   height: 5,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      Text("\$ ${data[index].price}",
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Consumer<LocalDBFavProvider>(
                        builder: (context, provider, child) => Container(
                          height: size.height * .05,
                          width: size.width * .11,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 228, 228),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              await (await LocalDbService.favDao).addContacts(
                                  Fav(
                                      null,
                                      data[index].title,
                                      data[index].type,
                                      data[index].image,
                                      data[index].price,
                                      data[index].id));

                              print("data sabeed");

                              
                              if (provider.getfavItems.isNotEmpty) {
                                provider.isFav = true;
                              } else {
                                provider.isFav = false;
                              }
                            },
                            icon: provider.getfavItems.isEmpty
                                ? const Icon(
                                    Icons.favorite_sharp,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                  ),
                          ),
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
}
