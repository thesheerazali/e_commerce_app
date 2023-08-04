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
import '../custom_widgets/home_search_motification_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> buildCategories() {
    return Data.generateCategories()
        .map(
          (e) => Container(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        e.id == 1 ? Colors.white : Colors.black38),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        e.id == 1 ? Colors.orange : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: Colors.orange,
                        child: Image.asset(
                          e.image,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(e.title, style: const TextStyle(fontSize: 14)),
                  ],
                ),
                onPressed: () {}),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Image.asset("assets/images/ic_menu.png"),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   actions: [Image.asset("assets/images/ic_search.png")],
      // ),
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
          const  AdsContainer(),
          const  SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buildCategories(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                    text: "New Men's",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              childAspectRatio: 0.9,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(5.0),
              children: Data.generateProducts()
                  .map(
                    (e) => Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      elevation: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                e.image,
                                height: 90,
                                width: double.infinity,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: e.type,
                                    style: const TextStyle(
                                        color: Colors.orange, fontSize: 16.0)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: e.title,
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 18.0)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                        text: "\$ ${e.price}",
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black87),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                      onPressed: () {})
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
