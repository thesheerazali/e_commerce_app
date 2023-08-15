import 'package:floor/floor.dart';

import '../entity/fav.dart';

@dao
abstract class FavDao {
  @Query("SELECT * FROM fav")
  Future<List<Fav>> getAllFavData();

  @Query("SELECT * FROM fav WHERE id =:id")
  Future<List<Fav>> clearCartByUId(int id);

  @Query('SELECT * FROM fav WHERE uid = :uid')
  Future<Fav?> getUserDataByEmail(String uid);

  // @Query('SELECT uid FROM fav WHERE uid = :uid')
  // Future<String?> getEmailByEmail(String email);

  @Query("SELECT * FROM fav WHERE uid=:uid AND productId=:id")
  Future<Fav?> getFavInDataByUid(String uid, int id);

  @insert
  Future<void> addContacts(Fav fav);
  @update
  Future<void> updateContacts(Fav fav);
  @delete
  Future<void> deleteContacts(Fav fav);
}
