import 'package:floor/floor.dart';

@entity
class Cart {
  @primaryKey
   final int productId;

  final String title, type, image , uid;
   double price;
   int quaintity;

  Cart({required this.productId, required this.title, required this.type, required this.image,required this.price,
      required this.quaintity, required this.uid});
}
