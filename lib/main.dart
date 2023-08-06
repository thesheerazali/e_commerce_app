import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/fav_screen.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/tab_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static int currentPage = 0;
  List pages = [
    const DashboardScreen(),
    const FavScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        TabIndicators(
          size: size,
          activeIdx: currentPage,
          activeColor: Theme.of(context).primaryColor,
          numTabs: 4,
          height: 4,
        ),
        myBottomAppBar(),
      ]),
      body: pages[currentPage],
    );
  }

  Widget myBottomAppBar() {
    Size size = MediaQuery.of(context).size;
    return BottomAppBar(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .085),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: currentPage == 0 ? Colors.blue : Colors.black,
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
              icon: const Icon(CupertinoIcons.home),
              iconSize: size.height * .03,
            ),
            IconButton(
                color: currentPage == 1 ? Colors.blue : Colors.black,
                onPressed: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
                icon: const Icon(CupertinoIcons.heart),
                iconSize: size.height * .03),
            IconButton(
                color: currentPage == 2 ? Colors.blue : Colors.black,
                onPressed: () {
                  setState(() {
                    currentPage = 2;
                  });
                },
                icon: const Icon(CupertinoIcons.cart),
                iconSize: size.height * .03),
            IconButton(
                color: currentPage == 3 ? Colors.blue : Colors.black,
                onPressed: () {
                  setState(() {
                    currentPage = 3;
                  });
                },
                icon: const Icon(CupertinoIcons.person),
                iconSize: size.height * .03),
          ],
        ),
      ),
    );
  }
}


// InkWell(
//               onTap: () {
//                 setState(() {
//                   currentPage = 0;
//                 });
//               },
//               child: Container(
//                 width: size.width * .35,
//                 height: size.height * .065,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: currentPage == 0 ? Colors.black : Colors.white,
//                 ),
//                 child: Center(
//                     child: Text(
//                   "Recommended",
//                   style: TextStyle(
//                     color: currentPage == 0 ? Colors.white : Colors.black,
//                   ),
//                 )),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   currentPage = 1;
//                 });
//               },
//               child: Container(
//                 width: size.width * .35,
//                 height: size.height * .065,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: currentPage == 1 ? Colors.black : Colors.white,
//                 ),
//                 child: Center(
//                     child: Text(
//                   "Recommended",
//                   style: TextStyle(
//                     color: currentPage == 1 ? Colors.white : Colors.black,
//                   ),
//                 )),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   currentPage = 2;
//                 });
//               },
//               child: Container(
//                 width: size.width * .35,
//                 height: size.height * .065,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: currentPage == 2 ? Colors.black : Colors.white,
//                 ),
//                 child: Center(
//                     child: Text(
//                   "Recommended",
//                   style: TextStyle(
//                     color: currentPage == 2 ? Colors.white : Colors.black,
//                   ),
//                 )),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   currentPage = 3;
//                 });
//               },
//               child: Container(
//                 width: size.width * .35,
//                 height: size.height * .065,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: currentPage == 3 ? Colors.black : Colors.white,
//                 ),
//                 child: Center(
//                     child: Text(
//                   "Recommended",
//                   style: TextStyle(
//                     color: currentPage == 3 ? Colors.white : Colors.black,
//                   ),
//                 )),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   currentPage = 4;
//                 });
//               },
//               child: Container(
//                 width: size.width * .35,
//                 height: size.height * .065,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: currentPage == 4 ? Colors.black : Colors.white,
//                 ),
//                 child: Center(
//                     child: Text(
//                   "Recommended",
//                   style: TextStyle(
//                     color: currentPage == 4 ? Colors.white : Colors.black,
//                   ),
//                 )),
//               ),
//             ),