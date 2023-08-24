import 'package:floor/floor.dart';


// @entity
// class Cart {
//   @PrimaryKey(autoGenerate: true)
//   final int? productId;

//   final String title, type, image, uid;
//   final int cateId;
//   double price;
//   int quaintity;

//   Cart(
//       {required this.productId,
//       required this.cateId,
//       required this.title,
//       required this.type,
//       required this.image,
//       required this.price,
//       required this.quaintity,
//       required this.uid});
// }

@Entity(tableName: 'cart_items')
class Cart {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int productId;
  final int quantity;
  final String userEmail;

  Cart({required this.id, required this.productId, required this.quantity,  required this.userEmail});
}
