// dao/person_dao.dart

import 'package:floor/floor.dart';

import 'entity.dart';

@dao
abstract class ProductDao {

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Product> findPersonById(int id);
  @insert
  Future<void> insertProduct(Product product);
}
