import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


import '../dao/cart_dao.dart';
import '../dao/category_dao.dart';
import '../dao/fav_dao.dart';
import '../dao/product_dao.dart';
import '../dao/user_dao.dart';
import '../entity/cart.dart';
import '../entity/category.dart';
import '../entity/fav.dart';
import '../entity/product.dart';
import '../entity/users.dart';


part 'shop_me_database.g.dart'; // the generated code will be there

@Database(
  version: 1,
  entities: [Category,Product, Users,Cart,Fav],
)
abstract class AppDatabase extends FloorDatabase {
  static const String dbName = "admin6.db";

 
 CartDao get cartDao;
  FavDao get favDao;
  UsersDao get userdao;
  CategoryDao get categoryDao;
  ProductDao get productDao;
}
