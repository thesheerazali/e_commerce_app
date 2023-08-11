import 'package:flutter/foundation.dart';

import '../db/entity/cart.dart';
import '../db/services/localdb_services.dart';

class LocalDBCartProvider extends ChangeNotifier {
  List<Cart> cartItems = [];
  List<Cart> get getcartItems => cartItems;

  fetchAllContacts() async {
    cartItems = await (await LocalDbService.cartDao).getAllCartDataByUid("NOT_SIGN_IN");

    notifyListeners();
  }

  addToCart(Cart cart) async {
    (await LocalDbService.cartDao).addContacts(cart);
    notifyListeners();
  }

  deleteItem(index) async {
    (await LocalDbService.cartDao).deleteContacts(Cart(
      productId: getcartItems[index].productId,
      title: getcartItems[index].title,
      type: getcartItems[index].type,
      image: getcartItems[index].image,
      price: getcartItems[index].price,
      quaintity: getcartItems[index].quaintity,
      uid: getcartItems[index].uid,
    ));

    notifyListeners();
  }
}
