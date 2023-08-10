// import 'package:flutter/foundation.dart';

// import '../db/entity/cart.dart';
// import '../db/services/localdb_services.dart';

// class LocalDBCartProvider extends ChangeNotifier {
//   List<Cart> cartItems = [];
//   List<Cart> get getcartItems => cartItems;

//   fetchAllContacts() async {
//     cartItems = await (await LocalDbService.cartDao).getAllCartData();

//     notifyListeners();
//   }

//   deleteItem(index) async {
//     await (await LocalDbService.cartDao).deleteContacts(Cart(
//         getcartItems[index].id,
//         getcartItems[index].title,
//         getcartItems[index].type,
//         getcartItems[index].image,
//         getcartItems[index].price,
//         getcartItems[index].quaintity));

//     notifyListeners();
//   }
// }
