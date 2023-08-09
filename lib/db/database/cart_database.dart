import 'dart:async';

import 'package:e_commerce_app/db/dao/cart_dao.dart';
import 'package:e_commerce_app/db/dao/fav_dao.dart';
import 'package:e_commerce_app/db/entity/cart.dart';
import 'package:e_commerce_app/db/entity/fav.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'cart_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Cart,Fav])
abstract class AppDatabase extends FloorDatabase {
  static const String dbName = "e_comtwo.db";
  CartDao get cartDao;
  FavDao get favDao;
}
