import 'package:e_commerce_app/db/dao/cart_dao.dart';
import 'package:e_commerce_app/db/dao/fav_dao.dart';

import '../database/cart_database.dart';

abstract class LocalDbService {
  static Future<AppDatabase> get _db async =>
      await $FloorAppDatabase.databaseBuilder(AppDatabase.dbName).build();

  static Future<CartDao> get cartDao async => (await _db).cartDao;

  static Future<FavDao> get favDao async => (await _db).favDao;
}
