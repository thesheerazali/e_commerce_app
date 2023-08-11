import 'package:floor/floor.dart';

import '../entity/fav.dart';

@dao
abstract class FavDao {
  @Query("SELECT * FROM fav")
  Future<List<Fav>> getAllFavData();

  @insert
  Future<void> addContacts(Fav fav);
  @update
  Future<void> updateContacts(Fav fav);
  @delete
  Future<void> deleteContacts(Fav fav);
}
