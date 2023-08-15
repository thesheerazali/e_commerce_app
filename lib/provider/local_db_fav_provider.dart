import 'package:flutter/foundation.dart';

import '../db/entity/fav.dart';
import '../db/services/localdb_services.dart';

class LocalDBFavProvider extends ChangeNotifier {
  List<Fav> favItems = [];
  List<Fav> get getfavItems => favItems;



  fetchAllContacts() async {
    favItems = await (await LocalDbService.favDao).getAllFavData();
   
    notifyListeners();
  }

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
