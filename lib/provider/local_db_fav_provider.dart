import 'package:flutter/foundation.dart';

import '../db/entity/fav.dart';
import '../db/services/localdb_services.dart';

class LocalDBFavProvider extends ChangeNotifier {
  List<Fav> favItems = [];
  List<Fav> get getfavItems => favItems;

  bool isFav = false;

  fetchAllContacts() async {
    favItems = await (await LocalDbService.favDao).getAllFavData() ;
    isFav = true;

    notifyListeners();
  }

  addToFav(Fav fav) async {
      (await LocalDbService.favDao).addContacts(fav);

    if (favItems.contains(fav)) {
      // productModels.remove(data);
      isFav = false;
    } else {
      // productModels.add(data);
      isFav = true;
    }
    notifyListeners();
  }

  deleteItem(Fav fav) async {
    (await LocalDbService.favDao).deleteContacts(fav);

    isFav = false;

    notifyListeners();
  }
}
