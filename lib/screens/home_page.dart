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
import 'package:flutter/material.dart';

import '../Data/data.dart';
import '../custom_widgets/categories_list_row.dart';
import '../custom_widgets/home_search_motification_bar.dart';
import 'home_detail_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // List<Widget> buildCategories() {
  //   return Data.generateCategories()
  //       .map(
  //         (e) => Container(
  //           padding: const EdgeInsets.only(left: 15, bottom: 10),
  //           child: ElevatedButton(
  //               style: ButtonStyle(
  //                   foregroundColor: MaterialStateProperty.all<Color>(
  //                       e.id == 1 ? Colors.white : Colors.black38),
  //                   backgroundColor: MaterialStateProperty.all<Color>(
  //                       e.id == 1 ? Colors.orange : Colors.white),
  //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                       RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(30)))),
  //               child: Row(
  //                 children: [
  //                   ClipRRect(
  //                     borderRadius: BorderRadius.circular(30),
  //                     child: Container(
  //                       color: Colors.orange,
  //                       child: Image.asset(
  //                         e.image,
  //                         height: 30,
  //                         width: 30,
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   Text(e.title, style: const TextStyle(fontSize: 14)),
  //                 ],
  //               ),
  //               onPressed: () {
  //                 setState(() {});
  //               }),
  //         ),
  //       )
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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

              CategoriesList(cateName: Data.categoryData),
              // SizedBox(
              //   height: 60,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: buildCategories(),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 0.65,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(5.0),
                  children: Data.generateProducts()
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(productdata: e),
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .055),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      height: size.height * .24,
                                      width: double.infinity,
                                      e.image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(e.title,
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18.0)),
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
                                      Text("\$ ${e.price}",
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold)),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          print("sheeraz");
                                        },
                                        child: Container(
                                          height: size.height * .05,
                                          width: size.width * .1,
                                          decoration: BoxDecoration(
                                            // color: const Color.fromARGB(
                                            //     255, 231, 228, 228),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: e.icon,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
