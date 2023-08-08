// dao/person_dao.dart

import 'package:floor/floor.dart';

import 'entity.dart';

@dao
abstract class ProductDao {
  @insert
  Future<void> insertProduct(Product product);
}
