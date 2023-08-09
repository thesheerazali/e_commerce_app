import 'dart:async';

import 'package:e_commerce_app/db/dao/cart_dao.dart';
import 'package:e_commerce_app/db/entity/cart.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'cart_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Cart])
abstract class AppDatabase extends FloorDatabase {
  static const String dbName = "cart_data.db";
  CartDao get cartDao;
}
