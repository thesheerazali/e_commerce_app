import 'package:floor/floor.dart';

import '../entity/cart.dart';

@dao 
abstract class CartDao{

   @Query("SELECT * FROM cart")
  Future<List<Cart>> getAllCartData();

  @insert
  Future<void> addContacts(Cart cart);
  @update
  Future<void> updateContacts(Cart cart);
  @delete
  Future<void> deleteContacts(Cart cart);
  
}