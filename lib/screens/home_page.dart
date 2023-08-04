import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/ads_container.dart';
import '../custom_widgets/categories_list_row.dart';
import '../custom_widgets/home_search_motification_bar.dart';
import '../custom_widgets/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
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
               CategoriesList(),
              
               ProductsVeiw(),
            ],
          ),
        ),
      ),
    );
  }
}
