// dao/person_dao.dart

import 'package:floor/floor.dart';

import '../entity/cart_entity.dart';

@dao
abstract class CartDAO {
  @Query('SELECT * FROM Cart WHERE uid = :uid')
  Stream<List<Cart>> getAllCartItemsbyUid(String uid);

  @Query('SELECT * FROM Cart WHERE uid = :uid AND id=:id')
  Stream<List<Cart>> getCartItemsbyUId(String uid, int id);

  @Query('DELETE * FROM Cart WHERE uid = :uid')
  Stream<List<Cart>> clearCartByUid(String uid);

  @insert
  Future<void> insertCart(Cart product);

  @update
  Future<void> updateCart(Cart product);

  @delete
  Future<void> deleteCart(Cart product);
}
