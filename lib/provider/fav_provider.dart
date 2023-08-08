import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class FavProvider extends ChangeNotifier {
  final List<ProductModel> productModels = [];
  List<ProductModel> get productModelsget => productModels;

  void addFav(ProductModel productModelsget, int index) {
    productModels.add(productModelsget);

    notifyListeners();
  }

  void removeFav(ProductModel productModelsget, int index) {
    productModels.remove(productModelsget);

    notifyListeners();
  }

  // bool isExit(
  //   ProductModel productMOdel1,
  // ) {
  //   final isExits = _productModels.contains(productMOdel1);

  //   return isExits;
  // }

 

 
}
