import 'package:flutter/material.dart';


import 'home_custom_widget/ads_container.dart';
import 'home_custom_widget/categories_tab_bar.dart';
import 'home_custom_widget/home_search_motification_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: const Column(
            children: [
              SizedBox(
                height: 60,
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
