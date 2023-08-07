// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '../custom_widgets/ads_container.dart';
// import '../custom_widgets/categories_list_row.dart';
// import '../custom_widgets/home_search_motification_bar.dart';
// import '../custom_widgets/products.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: const Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//                SizedBox(
//                 height: 30,
//               ),
//                SearchNotifBar(),
//                SizedBox(
//                 height: 20,
//               ),
//                AdsContainer(),
//                SizedBox(
//                 height: 20,
//               ),
//                CategoriesList(),

//                ProductsVeiw(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce_app/custom_widgets/ads_container.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../custom_widgets/categories_list_row.dart';
import '../custom_widgets/categories_tabBar.dart';
import '../custom_widgets/home_search_motification_bar.dart';
import 'home_detail_page.dart';

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
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
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
              CategorieTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
