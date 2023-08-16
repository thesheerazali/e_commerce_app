import 'package:flutter/cupertino.dart';


import '../db/entity/cart.dart';
import '../db/services/localdb_services.dart';

class LocalDBCartProvider extends ChangeNotifier {
  List<Cart> cartItems = [];
  List<Cart> get getcartItems => cartItems;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  fetchAllDataofCart() async {
    cartItems = await (await LocalDbService.cartDao).getAllFavData();

    notifyListeners();
  }

  addToCart(Cart cart) async {
    (await LocalDbService.cartDao).addContacts(cart);
    notifyListeners();
  }

  deleteItem(Cart cart) async {
    (await LocalDbService.cartDao).deleteContacts(cart);

    notifyListeners();
  }
}
