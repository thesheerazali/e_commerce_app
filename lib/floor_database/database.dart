// database.dart

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:e_commerce_app/floor_database/dao/cart_dao.dart';
import 'package:e_commerce_app/floor_database/entity/cart_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Cart])
abstract class ProductDatabase extends FloorDatabase {
  CartDAO get cartDao;
}
