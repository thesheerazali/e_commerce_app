import 'package:floor/floor.dart';

@entity
class Fav {
  @primaryKey
  final int? productId;

  final String title, type, image, uid;
  final double price;
   int quaintity;

    Fav({required this.productId,required this.title,required this.type,required this.image,required this.price,required this.quaintity, required this.uid});
}
