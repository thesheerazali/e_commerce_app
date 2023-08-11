import 'package:floor/floor.dart';

@entity
class Fav {
  @primaryKey
  final int? id;

  final String title, type, image;
  final double price;
  final int quaintity;

  Fav(this.id, this.title, this.type, this.image, this.price, this.quaintity);
}
