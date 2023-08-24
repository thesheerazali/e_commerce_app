import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'dart:io';

import '../../../db/entity/users.dart';
import '../../../db/services/localdb_services.dart';
import '../../../provider/text_field_controller_provider.dart';
import '../Widgets/Sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameControler = TextEditingController();

  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  File? _selectedImage;

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _signUp(context) async {
    var emailController =
        Provider.of<TextFieldsControllers>(context, listen: false)
            .emailControllerForSignUp;

    var existUser = await (await LocalDbService.usersDao)
        .getUserByEmailPassword(emailController.text, passwordController.text);

    print(existUser?.email);

    if (existUser?.email == emailController.text) {
      // ignore: use_build_context_synchronously
      snakeBar(context, "You are already SignIn");
      debugPrint("You are already SignIn");
    } else {
      final userData = Users(
          email: emailController.text,
          password: passwordController.text,
          name: nameControler.text,
          phone: contactNumberController.text,
          gender: genderController.text,
          profilepic: _selectedImage != null
              ? _selectedImage!.path
              : 'assets/images/userdefault.png',
          age: ageController.text,
          country: countryController.text);
      await (await LocalDbService.usersDao).insertUser(userData);
      // ignore: use_build_context_synchronously
      snakeBar(context, "Signup Successfull");
      debugPrint("Signup Successfull");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
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
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      child: _selectedImage == null
                          ? const CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/default.jpg'),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  FileImage(File(_selectedImage!.path)),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SignUpTextFields(
                      controller: nameControler,
                      hintText: "Enter Your Name",
                      validationText: "Name",
                      formKey: _formKey),
                  const SizedBox(height: 10),
                  SignUpTextFields(
                      controller: contactNumberController,
                      hintText: "Enter Contact Number",
                      validationText: "Contact Number",
                      formKey: _formKey),
                  const SizedBox(height: 10),
                  SignUpTextFields(
                      controller: countryController,
                      hintText: "Enter Your Country",
                      validationText: "Country",
                      formKey: _formKey),
                  const SizedBox(height: 10),
                  SignUpTextFields(
                      controller: genderController,
                      hintText: "Enter Gender",
                      validationText: "Gender",
                      formKey: _formKey),
                  const SizedBox(height: 10),
                  SignUpTextFields(
                      controller: ageController,
                      hintText: "Enter Your Age",
                      validationText: "Age",
                      formKey: _formKey),
                  const SizedBox(height: 10),
                  SignUpTextFields(
                      controller: Provider.of<TextFieldsControllers>(context,
                              listen: false)
                          .emailControllerForSignUp,
                      hintText: "Enter Your Email",
                      validationText: "Email",
                      formKey: _formKey),
                  const SizedBox(height: 10),
                  SignUpTextFields(
                      controller: passwordController,
                      hintText: "Enter Your Password",
                      validationText: "Password",
                      formKey: _formKey),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _signUp(context);

                      // _selectedImage = null;

                      // emailController.clear();
                      // nameControler.clear();
                      // contactNumberController.clear();
                      // passwordController.clear();
                      // ageController.clear();
                      // genderController.clear();
                      // countryController.clear();
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
                          "Registor",
                          style: GoogleFonts.lato(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
