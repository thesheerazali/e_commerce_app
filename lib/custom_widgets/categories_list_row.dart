import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/fav_screen.dart';
import '../screens/home_page.dart';
import '../screens/profile_screen.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  static int currentPage = 0;
  List pages = [
    const DashboardScreen(),
    const FavScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 0;
                });
              },
              child: Container(
                width: size.width * .35,
                height: size.height * .065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentPage == 0 ? Colors.black : Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Recommended",
                  style: TextStyle(
                    color: currentPage == 0 ? Colors.white : Colors.black,
                  ),
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 1;
                });
              },
              child: Container(
                width: size.width * .35,
                height: size.height * .065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentPage == 1 ? Colors.black : Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Recommended",
                  style: TextStyle(
                    color: currentPage == 1 ? Colors.white : Colors.black,
                  ),
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 2;
                });
              },
              child: Container(
                width: size.width * .35,
                height: size.height * .065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentPage == 2 ? Colors.black : Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Recommended",
                  style: TextStyle(
                    color: currentPage == 2 ? Colors.white : Colors.black,
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 3;
                });
              },
              child: Container(
                width: size.width * .35,
                height: size.height * .065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentPage == 3 ? Colors.black : Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Recommended",
                  style: TextStyle(
                    color: currentPage == 3 ? Colors.white : Colors.black,
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentPage = 4;
                });
              },
              child: Container(
                width: size.width * .35,
                height: size.height * .065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentPage == 4 ? Colors.black : Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Recommended",
                  style: TextStyle(
                    color: currentPage == 4 ? Colors.white : Colors.black,
                  ),
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
