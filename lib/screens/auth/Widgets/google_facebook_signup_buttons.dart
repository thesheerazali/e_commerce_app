import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleFacebookSignUpButton extends StatelessWidget {
  const GoogleFacebookSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 155.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/auth/icons/google.png"))),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 50.h,
            width: 155.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/auth/icons/facebook.png"))),
          ),
        ),
      ],
    );
  }
}
