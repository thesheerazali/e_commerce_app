

import 'package:e_commerce_app/provider/local_db_fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../db/entity/users.dart';
import '../../../db/services/localdb_services.dart';
import '../../../main.dart';
import '../Widgets/email_password_textfield.dart';
import '../Widgets/google_facebook_signup_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  String loginStatus = '';

  void _login(context) async {
    var emailController =
        Provider.of<LocalDBFavProvider>(context, listen: false).emailController;
    var passwordController =
        Provider.of<LocalDBFavProvider>(context, listen: false)
            .passwordController;
    var email = emailController.text;
    var pass = passwordController.text;
    final user = await (await LocalDbService.usersDao)
        .getUserByEmailPassword(email, pass);

    if (emailController.text == user?.email &&
        passwordController.text == user?.password) {
      setState(() {
        loginStatus = 'Login successful';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ));
      });
     
      // Fetch user-specific data using user.id if needed
    } else {
      setState(() {
        loginStatus = 'Invalid login credentials';
        snakeBar(context, loginStatus);
      });
    
    }
  }

  void _signUp(context) async {
    var emailController =
        Provider.of<LocalDBFavProvider>(context, listen: false).emailController;
    var passwordController =
        Provider.of<LocalDBFavProvider>(context, listen: false)
            .passwordController;
    var existUser = await (await LocalDbService.usersDao)
        .getUserByEmailPassword(emailController.text, passwordController.text);

    if (existUser?.email == emailController.text) {
      // ignore: use_build_context_synchronously
      snakeBar(context, "You are already SignIn");
      debugPrint("You are already SignIn");
    } else {
      final userData = Users(
          email: emailController.text,
          password: passwordController.text,
          name: "sheeraz",
          phone: "89365",
          gender: "male");
      await (await LocalDbService.usersDao).insertUser(userData);
      // ignore: use_build_context_synchronously
      snakeBar(context, "Signup Successfull");
      debugPrint("Signup Successfull");
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailController =
        Provider.of<LocalDBFavProvider>(context, listen: false).emailController;
    var passwordController =
        Provider.of<LocalDBFavProvider>(context, listen: false)
            .passwordController;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffe6d29),
              Color(0xffff9305),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.only(
                      top: 30.h,
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios)),
                // Padding(
                //   padding: EdgeInsets.only(top: 40.h, left: 90.w),
                //   child: Image.asset(
                //     "assets/auth/blackLogo.png",
                //     height: 50,
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Login To Your Account",
              style: GoogleFonts.lato(
                  fontSize: 26.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            EmailPasswordTextField.emailTextField(emailController),
            SizedBox(
              height: 10.h,
            ),
            EmailPasswordTextField.passwordTextField(passwordController),
            Padding(
              padding: EdgeInsets.only(left: 150.w),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Your Password?",
                    style: GoogleFonts.lato(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                _login(context);
              },
              child: Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    "Log in",
                    style: GoogleFonts.lato(
                        fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Not yet a member?",
                    style: GoogleFonts.lato(
                        fontSize: 14.sp, color: Colors.orange[900])),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.lato(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                _signUp(context);
              },
              child: Container(
                height: 50.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.apple),
                      Text(
                        "Sign in With Apple",
                        style: GoogleFonts.lato(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            const GoogleFacebookSignUpButton(),
          ]),
        ),
      ),
    );
  }

  void snakeBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
      ),
    );
  }
}
