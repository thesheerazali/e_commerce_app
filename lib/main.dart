// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce_app/provider/local_db__cart_provider.dart';
import 'package:e_commerce_app/provider/local_db_fav_provider.dart';
import 'package:e_commerce_app/screens/auth/screens/starting_screen.dart';
import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/screens/favorite/fav_screen.dart';
import 'package:e_commerce_app/screens/home/home_page.dart';
import 'package:e_commerce_app/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalDBCartProvider()),
        ChangeNotifierProvider(create: (context) => LocalDBFavProvider()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StartScreen(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const CartScreen(),
    const FavScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<LocalDBCartProvider>(context, listen: false)
        .fetchAllDataofCart();
    Provider.of<LocalDBFavProvider>(context, listen: false).fetchAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffe6d29),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .03,
        ),
        child: GNav(
          backgroundColor: Color(0xfffe6d29),

          gap: 5,
          activeColor: Color(0xffff9305),
          // tabBackgroundColor: Colors.blue,
          onTabChange: (value) {
            currentPage = value;
            setState(() {});
          },

          tabs: [
            const GButton(
              icon: CupertinoIcons.home,
              text: "Home",
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff9305),
                  fontSize: 18),
            ),
            const GButton(
              icon: CupertinoIcons.cart,
              text: "Cart",
            ),
            const GButton(
              icon: Icons.notification_add_outlined,
              text: "Notification",
            ),
            GButton(
              padding: EdgeInsets.only(right: size.width * .07),
              icon: CupertinoIcons.person,
              text: "Profile",
            )
          ],
        ),
      ),
    );
  }
}
