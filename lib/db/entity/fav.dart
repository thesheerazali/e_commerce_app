import 'package:floor/floor.dart';

// @entity
// class Fav {
//   @PrimaryKey(autoGenerate: true)
//   final int? productId;

//   final String uid;
//   final int cateId;
//   final String? title, type, image;
//   final double? price;
//   int? quaintity;

//   Fav(
//       {required this.productId,
//       required this.cateId,
//       required this.title,
//       required this.type,
//       required this.image,
//       required this.price,
//       required this.quaintity,
//       required this.uid});
// }

@Entity(tableName: 'favorite_items')
class Fav {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int productId;
  final String userEmail;

  Fav({required this.id, required this.productId, required this .userEmail});
}
