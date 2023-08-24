import 'package:floor/floor.dart';

import 'category.dart';

@Entity(tableName: 'products', foreignKeys: [
  ForeignKey(
    childColumns: ['categoryId'],
    parentColumns: ['id'],
    entity: Category,
  )
])
class Product {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String title;
  String size;
  double price;
  double discount;
  bool isFavorite;
  String image;
  bool isInCart;

  String type;
  String description;

  final int categoryId;

  // Foreign Key

  // final String? userEmail;

  Product({
    required this.title,
    required this.image,
    required this.type,
    required this.description,
    required this.id,
    required this.size,
    required this.price,
    required this.discount,
    required this.categoryId,
    required this.isFavorite,
    required this.isInCart,
    // required this.userEmail,
  });
}
