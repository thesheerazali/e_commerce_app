import 'package:flutter/material.dart';

import '../db/entity/fav.dart';
import '../db/services/localdb_services.dart';

class LocalDBFavProvider extends ChangeNotifier {
  List<Fav> favItems = [];
   List<Fav> favItemsbyEmail = [];

  List<Fav> get getfavItems => favItems;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  fetchAllContacts() async {
    favItems = await (await LocalDbService.favDao).getAllFavData();

    notifyListeners();
  }

  // datafectFromEmail() async {
  //   // var emails = await (await LocalDbService.usersDao)
  //   //     .getEmailByEmail(emailController.text);

  // favItemsbyEmail =  (await (await LocalDbService.favDao)
  //       .getUserDataByEmail(emailController.text)) as List<Fav>;

  //   notifyListeners();
  // }

  getById(index) async {
    await (await LocalDbService.favDao).getAllFavData();
    ;
  }

  addToFav(Fav fav) async {
    (await LocalDbService.favDao).addContacts(fav);

    notifyListeners();
  }

  deleteItem(Fav fav) async {
    (await LocalDbService.favDao).deleteContacts(fav);

    notifyListeners();
  }
}
