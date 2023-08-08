// database.dart

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:e_commerce_app/floor_database/dao.dart';
import 'package:e_commerce_app/floor_database/entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Product])
abstract class ProductDatabase extends FloorDatabase {
  ProductDao get productDao;
}
