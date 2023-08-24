import 'package:e_commerce_app/provider/text_field_controller_provider.dart';
import 'package:e_commerce_app/screens/auth/screens/starting_screen.dart';
import 'package:e_commerce_app/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/screens/favorite/fav_screen.dart';
import 'package:e_commerce_app/screens/home/product_display.dart';
import 'package:e_commerce_app/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   addCate();
  //   addProduct();
  // }

  // addCate() async {
  //   await (await LocalDbService.categoryDap)
  //       .insertCategory(Category(null, "Shirts"));
  //   await (await LocalDbService.categoryDap)
  //       .insertCategory(Category(null, "Sneakers"));
  //   await (await LocalDbService.categoryDap)
  //       .insertCategory(Category(null, "Jeans"));
  //   await (await LocalDbService.categoryDap)
  //       .insertCategory(Category(null, "T-Shirts"));
  //   await (await LocalDbService.categoryDap)
  //       .insertCategory(Category(null, "Trousers"));
  //   await (await LocalDbService.categoryDap)
  //       .insertCategory(Category(null, "Shorts"));
  // }

  // addProduct() async {
  //   Product proShirts = Product(
  //       title: "Check",
  //       image: "assets/images/pic1.jpg",
  //       type: "Casual",
  //       description:
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //       id: null,
  //       size: "40",
  //       price: 199,
  //       discount: 10,
  //       categoryId: 1,
  //       isFavorite: false,
  //       isInCart: false);

  //   Product proShirts2 = Product(
  //       title: "high neck",
  //       image: "assets/images/pic4.jpg",
  //       type: "party",
  //       description:
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //       id: null,
  //       size: "36",
  //       price: 249,
  //       discount: 10,
  //       categoryId: 1,
  //       isFavorite: false,
  //       isInCart: false);

  //   await (await LocalDbService.productDao).insertProduct(proShirts);
  //   await (await LocalDbService.productDao).insertProduct(proShirts2);

  //   Product proSneakers = Product(
  //       title: "Jorder",
  //       image: "assets/images/shoes3.jpg",
  //       type: "Casual",
  //       description:
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //       id: null,
  //       size: "42",
  //       price: 499,
  //       discount: 15,
  //       categoryId: 2,
  //       isFavorite: false,
  //       isInCart: false);

  //   Product proSneakers2 = Product(
  //       title: "Nike",
  //       image: "assets/images/shoes5.jpg",
  //       type: "Outer",
  //       description:
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //       id: null,
  //       size: "44",
  //       price: 699,
  //       discount: 12,
  //       categoryId: 2,
  //       isFavorite: false,
  //       isInCart: false);

  //   await (await LocalDbService.productDao).insertProduct(proSneakers);
  //   await (await LocalDbService.productDao).insertProduct(proSneakers2);

  //   Product proJeans = Product(
  //       title: "Ripped",
  //       image: "assets/images/jeans2.jpg",
  //       type: "Outer",
  //       description:
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //       id: null,
  //       size: "32",
  //       price: 199,
  //       discount: 18,
  //       categoryId: 3,
  //       isFavorite: false,
  //       isInCart: false);

  //   Product proJeans2 = Product(
  //       title: "Plain",
  //       image: "assets/images/jeans1.jpg",
  //       type: "Casula",
  //       description:
  //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //       id: null,
  //       size: "34",
  //       price: 249,
  //       discount: 20,
  //       categoryId: 3,
  //       isFavorite: false,
  //       isInCart: false);

  //   await (await LocalDbService.productDao).insertProduct(proJeans);
  //   await (await LocalDbService.productDao).insertProduct(proJeans2);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TextFieldsControllers()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
            useMaterial3: true,

            primaryColor: Color(0xfffe6d29), // Set your primary color here
            // hintColor: Color(0xfffe6d29), // You can also set the accent color
            // Add other theme settings here
          ),
          debugShowCheckedModeBanner: false,
          home: const StartScreen(),
        ),
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
  int currentPage = 0;

  List<Widget> pages = [
    const HomePage(),
    CartScreen(),
    FavScreen(),
    const ProfileScreen(),
  ];

  DateTime? currentBackPressTime; // Add this variable

  @override
  Widget build(BuildContext context) {
   
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press
        if (currentPage != 0) {
          setState(() {
            currentPage = 0;
          });

          // Update the active tab
          return false; // Prevent the default back navigation
        }
        return true;
      },
      child: Scaffold(
        //backgroundColor: const Color(0xfffe6d29),
        //backgroundColor: const Color(0xfffe6d29),
        // backgroundColor: Colors.black,
        body: pages[currentPage],
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xfffe6d29),
          unselectedItemColor: Colors.black,
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}


// class MainPage extends StatefulWidget {
//   const MainPage({
//     super.key,
//   });

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   static int currentPage = 0;
//   List<Widget> pages = [
//     const HomePage(),
//     CartScreen(),
//     FavScreen(),
//     const ProfileScreen(),
//   ];

//   DateTime? currentBackPressTime;
//   GlobalKey<GNavState> _gNavKey = GlobalKey<GNavState>();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color(0xfffe6d29),
//       body: WillPopScope(
//         onWillPop: () async {
//           // Handle the back button press
//           if (currentPage != 0) {
//             setState(() {
//               currentPage = 0;
//             });
//             return false; // Prevent the default back navigation
//           }
//           if (currentBackPressTime == null ||
//               DateTime.now().difference(currentBackPressTime!) >
//                   Duration(seconds: 2)) {
//             currentBackPressTime = DateTime.now();
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Press back again to leave"),
//               ),
//             );
//             return false;
//           }
//           return true; // Allow the back button to execute
//         },
//         child: pages[currentPage],
//       ),
//       resizeToAvoidBottomInset: false,
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: size.width * .03,
//         ),
//         child: GNav(
          // backgroundColor: Color(0xfffe6d29),

//           activeColor: Color.fromARGB(255, 231, 228, 228),
//           // tabBackgroundColor: Colors.blue,
//           onTabChange: (value) {
//             currentPage = value;
//             setState(() {});
//           },

//           tabs: [
//             const GButton(
//               icon: CupertinoIcons.home,
//               text: "Home",
//               textStyle: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 231, 228, 228),
//                   fontSize: 18),
//             ),
//             const GButton(
//               icon: CupertinoIcons.cart,
//               text: "Cart",
//             ),
//             const GButton(
//               icon: Icons.favorite_border_outlined,
//               text: "Favorites",
//             ),
//             GButton(
//               padding: EdgeInsets.only(right: size.width * .07),
//               icon: CupertinoIcons.person,
//               text: "Profile",
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
