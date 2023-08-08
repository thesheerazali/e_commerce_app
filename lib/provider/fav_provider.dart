import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class FavProvider extends ChangeNotifier {
  final List<ProductModel> productModels = [];
  List<ProductModel> get productModelsget => productModels;

  bool isFav = false;

  int index = 0;

  void addFav(
    ProductModel data,
  ) {
    // productModels.add(productModelsget);

    if (productModels.contains(data)) {
      productModels.remove(data);

      false;
    } else {
      productModels.add(data);
      index + 1;
      isFav = true;
    }

    notifyListeners();
  }

  bool isExit(
    ProductModel productMOdel1,
  ) {
    final isExits = productModels.contains(productMOdel1);

    return isExits;
  }
}
