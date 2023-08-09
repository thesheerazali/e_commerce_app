import 'package:e_commerce_app/db/entity/fav.dart';
import 'package:flutter/foundation.dart';

import '../db/entity/cart.dart';
import '../db/services/localdb_services.dart';

class LocalDBFavProvider extends ChangeNotifier {
  List<Fav> favItems = [];
  List<Fav> get getfavItems => favItems;

  bool isFav = false;

  fetchAllContacts(Fav data) async {

     favItems = await (await LocalDbService.favDao).getAllFavData();

    if (favItems.contains(data)) {
      favItems.remove(data);
     isFav = false;
    } else {
      favItems.add(data);
      isFav = true;
    }
   

    notifyListeners();
  }

  deleteItem(index) async {
    await (await LocalDbService.cartDao).deleteContacts(Cart(
        getfavItems[index].id,
        getfavItems[index].title,
        getfavItems[index].type,
        getfavItems[index].image,
        getfavItems[index].price,
        getfavItems[index].quaintity));

    notifyListeners();
  }
}







// import 'package:e_commerce_app/model/product_model.dart';
// import 'package:flutter/cupertino.dart';

// class FavProvider extends ChangeNotifier {
//   final List<ProductModel> productModels = [];
//   List<ProductModel> get productModelsget => productModels;

//   bool isFav = false;
  
 

//   void addFav(
//     ProductModel data,
//   ) {
//     // productModels.add(productModelsget);

    // if (productModels.contains(data)) {
    //   productModels.remove(data);
    //  isFav = false;
    // } else {
    //   productModels.add(data);
    //   isFav = true;
    // }

//     notifyListeners();
//   }

//   bool isExit(
//     ProductModel productMOdel1,
//   ) {
//     final isExits = productModels.contains(productMOdel1);

//     return isExits;
//   }
// }

