


import '../dao/cart_dao.dart';
import '../dao/fav_dao.dart';
import '../dao/user_dao.dart';
import '../database/shop_me_database.dart';

abstract class LocalDbService {
  static Future<AppDatabase> get _db async =>
      $FloorAppDatabase.databaseBuilder(AppDatabase.dbName).build();

 static Future<CartDao> get cartDao async => (await _db).cartDao;
  static Future<FavDao> get favDao async => (await _db).favDao;
    static Future<UsersDao> get usersDao async => (await _db).userdao;
}


// class LocalDbService2 {
//   static AppDatabase? _database;

//   static Future<AppDatabase?> get database async {
  
//       _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
   
//     return _database;
//   }
// }