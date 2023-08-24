import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../db/entity/users.dart';
import '../../db/services/localdb_services.dart';
import '../../provider/text_field_controller_provider.dart';
import '../favorite/fav_page_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Users?> userData(context) async {
    var emailController =
        Provider.of<TextFieldsControllers>(context, listen: false)
            .emailControllerForLogin;

    print(emailController.text);

    return await (await LocalDbService.usersDao)
        .getUserByEmail(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xfffe6d29),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .06,
        ),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          const FavPageAppBar(title: "User Profile"),
          FutureBuilder<Users?>(
            future: userData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading User Profile'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No User Found '));
              } else {
                final userData = snapshot.data;

                return Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  FileImage(File(userData!.profilepic))),
                          const SizedBox(height: 20),
                          Text(
                            "${userData.name} Ali ",
                            style: GoogleFonts.lato(
                                fontSize: 26.sp, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Card(
                            color: const Color.fromARGB(255, 231, 228, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.cake, color: Colors.red),
                              title: Text('Age'),
                              subtitle: Text(userData.age),
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(255, 231, 228, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: const Icon(Icons.location_on,
                                  color: Colors.red),
                              title: Text('Country'),
                              subtitle: Text(userData.country),
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(255, 231, 228, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.phone, color: Colors.red),
                              title: Text('Contact Number'),
                              subtitle: Text(userData.phone),
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(255, 231, 228, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.people, color: Colors.red),
                              title: Text('Gender'),
                              subtitle: Text(userData.gender),
                            ),
                          ),
                          Card(
                            color: const Color.fromARGB(255, 231, 228, 228),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading:
                                  const Icon(Icons.email, color: Colors.red),
                              title: Text('Email'),
                              subtitle: Text(userData.email),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          )
        ]),
      ),
    ));
  }
}
