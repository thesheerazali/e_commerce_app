import 'package:floor/floor.dart';

import '../entity/cart.dart';

@dao
abstract class CartDao {

  @Query("SELECT * FROM cart")
  Future<List<Cart>> getAllFavData();
  
  @Query("SELECT * FROM cart WHERE uid=:uid")
  Future<List<Cart>> getCartForUser(String uid);

  @Query("SELECT * FROM cart WHERE uid=:uid AND productId=:id")
  Future<Cart?> getCartInDataByUid(String uid, int id);

  @Query("DELETE FROM cart WHERE uid =:uid")
  Future<List<Cart>> clearCartByUId(String uid);

  @Query("UPDATE cart SET uid=:uid")
  Future<void> updateUidCart(String uid);

  @insert
  Future<void> addContacts(Cart cart);
  @update
  Future<int> updateContacts(Cart cart);
  @delete
  Future<int> deleteContacts(Cart cart);
}
