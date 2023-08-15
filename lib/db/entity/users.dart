import 'package:floor/floor.dart';

@entity
class Users {
  @primaryKey
  final String email;

  final String password;
  final String? name;
  final String? phone;
  final String? gender;

  Users(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone,
      required this.gender});
}

// import 'package:flutter/material.dart';
// import 'package:floor/floor.dart';
// import 'package:path/path.dart';
// import 'dart:async';

// // Define the User entity
// @Entity(tableName: 'user')
// class User {
//   @PrimaryKey(autoGenerate: true)
//   final int id;

//   final String email;
//   final String password;

//   User({required this.id, required this.email, required this.password});
// }

// // Define the UserDao
// @dao
// abstract class UserDao {
//   @Query('SELECT * FROM user WHERE email = :email AND password = :password')
//   Future<User?> loginUser(String email, String password);
// }

// // Define the AppDatabase
// @Database(version: 1, entities: [User])
// abstract class AppDatabase extends FloorDatabase {
//   UserDao get userDao;
// }

// void main() async {
//   final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

//   runApp(MyApp(database));
// }

// class MyApp extends StatelessWidget {
//   final AppDatabase database;

//   MyApp(this.database);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Floor Login Example',
//       home: LoginPage(database),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   final AppDatabase database;

//   LoginPage(this.database);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   String loginStatus = '';

//   void _login() async {
//     final email = emailController.text;
//     final password = passwordController.text;

//     final user = await widget.database.userDao.loginUser(email, password);
//     if (user != null) {
//       setState(() {
//         loginStatus = 'Login successful';
//       });
//       // Fetch user-specific data using user.id if needed
//     } else {
//       setState(() {
//         loginStatus = 'Invalid login credentials';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             SizedBox(height: 10),
//             Text(loginStatus),
//           ],
//         ),
//       ),
//     );
//   }
// }
// In this example, we've created a simple Flutter app with a user login screen that interacts with the Floor local database for authentication. The app includes two text fields for entering the email and password, a login button, and a status message to display the login result.

// Please note that this is a basic example for demonstration purposes. In a real-world scenario, you would likely want to add more security measures (such as password hashing) and improve the overall UI/UX of your application.





