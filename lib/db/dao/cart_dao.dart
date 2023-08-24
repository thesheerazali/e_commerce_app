import 'package:floor/floor.dart';

import '../entity/cart.dart';

@dao
abstract class CartDao {
  @Query("SELECT * FROM cart_items")
  Future<List<Cart>> getAllFavData();

  // @Query("SELECT * FROM cart WHERE uid=:uid")
  // Future<List<Cart>> getCartForUser(String uid);

  // @Query("SELECT * FROM cart WHERE uid=:uid AND itemId = :itemId LIMIT 1")
  // Future<Cart?> getCartInDataByUid(String uid, int itemId);

  // @Query("DELETE FROM cart WHERE uid =:uid")
  // Future<List<Cart>> clearCartByUId(String uid);

  // @Query("UPDATE cart SET uid=:uid")
  // Future<void> updateUidCart(String uid);

  @Query('SELECT * FROM cart_items WHERE productId = :productId')
  Future<Cart?> getCartItemByProductId(int productId);


  @Query('DELETE FROM cart_items WHERE productId = :productId')
  Future<void> deleteCartItemByProductId(int productId);

    @Query('SELECT * FROM cart_items WHERE userEmail = :userEmail')
  Future<List<Cart>> getCartItemsByUserId(String userEmail);


  @Query('DELETE FROM cart_items WHERE productId = :productId AND userEmail = :userEmail')
  Future<void> removeCartItem(int productId, String userEmail);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCartItem(Cart catItems);
  @update
  Future<int> updateContacts(Cart cart);
  @delete
  Future<int> deleteContacts(Cart cart);
}
