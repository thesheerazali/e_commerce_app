import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class FavProvider extends ChangeNotifier {
  final List<ProductModel> _productModels = [];
  List<ProductModel> get productModels => _productModels;
  

  void fav(ProductModel productModels, int index) {
    final isExist = _productModels.contains(productModels);

    if (isExist) {
      _productModels.remove(productModels);
    } else {
      _productModels.add(productModels);
   
    }
    notifyListeners();
  }

  bool isExit(
    ProductModel productMOdel1,
  ) {
    final isExits = _productModels.contains(productMOdel1);

    return isExits;
  }
}
