import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../screens/home_detail_page.dart';

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
              padding: EdgeInsets.only(left: size.width * .075),
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.transparent,
              tabs: [
                categoryContainer(
                    index: 0, size: size, currentTab: _tabController.index),
                categoryContainer(
                    index: 1, size: size, currentTab: _tabController.index),
                categoryContainer(
                    index: 2, size: size, currentTab: _tabController.index),
                categoryContainer(
                    index: 3, size: size, currentTab: _tabController.index),
                categoryContainer(
                    index: 4, size: size, currentTab: _tabController.index),
                categoryContainer(
                    index: 5, size: size, currentTab: _tabController.index),
              ]),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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

  Widget categoryContainer(
      {required Size size, required int index, required int currentTab}) {
    return Container(
      width: size.width * .35,
      height: size.height * .065,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 231, 228, 228),
        ),
        borderRadius: BorderRadius.circular(10), // Creates border
        color: currentTab == index ? Colors.black : Colors.white,
      ),
      child: Center(
        child: Text(
          cateName[index],
          style: TextStyle(
            color: currentTab == index ? Colors.white : Colors.black,
          ),
        ),
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
        childAspectRatio: size.aspectRatio / .77,
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
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        height: size.height * .24,
                        width: double.infinity,
                        image: data[index].image.image,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(data[index].type,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 18.0)),
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
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Container(
                        height: size.height * .05,
                        width: size.width * .11,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 228, 228),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.favorite_border_outlined),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
