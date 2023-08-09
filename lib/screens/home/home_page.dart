import 'dart:math';

import 'package:e_commerce_app/floor_database/dao/cart_dao.dart';
import 'package:e_commerce_app/floor_database/database.dart';
import 'package:e_commerce_app/floor_database/entity/cart_entity.dart';
import 'package:e_commerce_app/screens/home/components/ads_container.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/const.dart';
import 'components/categories_tab_bar.dart';
import 'components/home_search_motification_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CartDAO> getDao() async {
    final database =
        await $FloorAppDatabase.databaseBuilder("e_com_app.db").build();

    final daiCart = database.cartDao;
    ;
    return daiCart;
  }

  @override
  Widget build(BuildContext context) {
    var data = getDao();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // floatingActionButton: StreamBuilder(
        //   stream: data.asStream(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       var dao = snapshot.data;

        //       List list = dao!.getAllCartItemsbyUid(UID) as List<Cart>;

        //       return FloatingActionButton(
        //         onPressed: () {},
        //         child: const Icon(CupertinoIcons.cart),
        //       ).badge(
        //         color: Colors.red,
        //         size: 20,
        //         count: list.isNotEmpty
        //             ? list
        //                 .map<int>((e) => e.quintity)
        //                 .reduce((value, element) => value + element)
        //             : 0,
        //       );
        //     }

        //     return Container();
        //   },
        // ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: const SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SearchNotifBar(),
              SizedBox(
                height: 20,
              ),
              AdsContainer(),
              SizedBox(
                height: 20,
              ),
              CategorieTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
