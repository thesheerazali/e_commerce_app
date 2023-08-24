
import 'package:floor/floor.dart';

import '../entity/fav.dart';

@dao
abstract class FavDao {
  @Query("SELECT * FROM favorite_items ")
  Future<List<Fav>> getAllFav();

  // @Query('SELECT * FROM fav WHERE uid = :uid')
  // Future<Fav?> getUserDataByEmail(String uid);

  // @Query('SELECT * FROM fav WHERE uid = :uid')
  // Future<List<Fav>> getFavoritesForUser(String uid);
  // @Query('SELECT uid FROM fav WHERE uid = :uid')
  // Future<String?> getEmailByEmail(String email);

  // @Query("SELECT * FROM fav WHERE uid=:uid AND itemId = :itemId LIMIT 1")
  // Future<Fav?> getFavInDataByUid(String uid, int itemId);

  // @Query('SELECT * FROM fav WHERE uid = :uid')
  // Future<List<Fav>> getFavoritesForUser(String uid);

  // @Query('DELETE FROM favorite_items WHERE productId = :productId')
  // Future<void> deleteFavoriteItemByProductId(int productId);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertFavoriteItem(Fav favoriteItem);

  @Query('SELECT * FROM favorite_items WHERE userEmail = :userEmail')
  Future<List<Fav>> getFavoriteItemsByUserId(String userEmail);

   @Query('DELETE FROM favorite_items WHERE productId = :productId AND userEmail = :userEmail')
  Future<void> removeFavoriteItem(int productId, String userEmail);

  // @Query('DELETE FROM favorite_items WHERE userEmail = :userEmail')
  // Future<void> deleteFavoriteItemByUserEmail(String userEmail);
  // @Insert(onConflict: OnConflictStrategy.replace)
  // Future<void> addToFav(Fav fav);
  // @update
  // Future<void> updateContacts(Fav fav);
  @delete
  Future<void> deleteFav(Fav fav);
}
