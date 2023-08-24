import 'package:flutter/material.dart';

class TextFieldsControllers extends ChangeNotifier {
  final TextEditingController emailControllerForLogin = TextEditingController();
  final TextEditingController passwordControllerForLogin =
      TextEditingController();

  final TextEditingController emailControllerForSignUp =
      TextEditingController();

  bool isFavorite = false;
}
