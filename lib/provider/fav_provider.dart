import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../Data/data.dart';

class FavProvider extends ChangeNotifier {
  final List<ProductModel> _productModels = [];
  List<ProductModel> get productModels => _productModels;

  List<ProductModel> recommendedProductData =
      Data.generateProductsRecommended();

  void fav(ProductModel productModels, int index) {
    final isExist = _productModels.contains(productModels);
    print(isExist);

    if (isExist) {
      _productModels.remove(productModels);
    } else {
      _productModels.add(productModels);
    }
    notifyListeners();
  }

  bool isExit(List<ProductModel> productMOdel1, int index) {
    final isExits = _productModels.contains(productMOdel1[index]);
    return isExits;
  }
}
