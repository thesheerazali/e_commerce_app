import 'package:e_commerce_app/provider/fav_provider.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/fav_screen.dart';
import 'package:e_commerce_app/screens/home/home_page.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
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

  final List pages = [
    const DashboardScreen(),
    const CartScreen(),
    const FavScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .03,
        ),
        child: GNav(
          gap: 5,
          activeColor: Colors.blue,
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
                  color: Colors.blue,
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
      body: pages[currentPage],
    );
  }
}
