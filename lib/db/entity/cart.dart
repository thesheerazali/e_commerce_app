import 'package:floor/floor.dart';

@entity
class Cart {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title, type, image;
  final double price ;
  final int quaintity;

  Cart(this.id,this.title, this.type, this.image, this.price, this.quaintity);
}
