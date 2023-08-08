import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/screens/home/components/ads_container.dart';

import 'package:flutter/material.dart';

import '../../Data/data.dart';
import 'components/categories_tab_bar.dart';
import 'components/home_search_motification_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
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
