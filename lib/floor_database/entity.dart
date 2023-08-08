// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Product {
  @primaryKey
  final int id;

  final String title;
  final String description;

  Product(this.id, this.title, this.description);
}