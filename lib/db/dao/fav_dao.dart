import 'package:e_commerce_app/db/entity/fav.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavDao {
  @Query("SELECT * FROM fav")
  Future<List<Fav>> getAllFavData();

  @insert
  Future<void> addContacts(Fav fav);
  @update
  Future<void> updateContacts(Fav fav);
  @delete
  Future<void> deleteContacts(Fav cart);
}
