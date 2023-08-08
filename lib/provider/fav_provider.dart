import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class FavProvider extends ChangeNotifier {
  final List<ProductModel> productModels = [];
  List<ProductModel> get productModelsget => productModels;

  void addFav(ProductModel data, int index) {
    // productModels.add(productModelsget);

    if (productModels.contains(data)) {
      productModels.remove(data);
    } else {
      productModels.add(data);
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
