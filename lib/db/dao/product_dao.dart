import 'package:floor/floor.dart';

import '../entity/cart.dart';
import '../entity/fav.dart';
import '../entity/product.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM products')
  Future<List<Product>> getAllProducts();

  @Query('SELECT * FROM products WHERE categoryId = :categoryId')
  Future<List<Product>> getProductsByCategoryId(int categoryId);

  @Query('SELECT * FROM products WHERE id = :productId')
  Future<Product?> getProductById(int productId);

  @Query('SELECT isFavorite FROM products')
Future<bool?> getProductFav();

  // @Query(
  //     "SELECT * FROM products WHERE isFavorite =:isFav")
  // Future<List<Product>> getAllFavData({bool isFav = false} );

  @Query('SELECT * FROM products WHERE isFavorite = :isFav AND id IN '
    '(SELECT productId FROM favorite_items WHERE userEmail = :userEmail)')
Future<List<Product>> getFavoriteProductsForUser(bool isFav,String userEmail);

 @Query('SELECT * FROM products WHERE isInCart = :isInCart AND id IN '
    '(SELECT productId FROM cart_items WHERE userEmail = :userEmail)')
Future<List<Product>> getCartProductsForUser(bool isInCart,String userEmail);

  // @Query("SELECT * FROM products WHERE isInCart =:isInCart AND userEmail =:userEmail")
  // Future<List<Product>> getAllCartData({bool isInCart = false ,  String userEmail});

//   @Query('SELECT p.*, fi.productId IS NOT NULL as isFavorite FROM products p LEFT JOIN favorite_items fi ON p.id = fi.productId WHERE p.categoryId = :categoryId')
// Future<List<ProductWithFavoriteStatus>> getProductsWithFavoriteStatusByCategoryId(int categoryId);

  @update
  Future<void> updateProduct(Product product);

  @insert
  Future<void> addProductToFavorites(Fav favoriteItem);

  @insert
  Future<void> addProductToCart(Cart cartItem);

  // Other CRUD operations for products
  @insert
  Future<void> insertProduct(Product product);
}
