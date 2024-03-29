import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Widgets/login_signup_container.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/auth/Welcome/background@3x.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/auth/blackLogo.png",
                    color: Colors.white,
                    height: 150.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Welcome to the Gorilla Shop (GOCO)",
                    style: GoogleFonts.lato(
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const LoginSignUpContainer(),
        ],
      ),
    );
  }
}
