import 'package:floor/floor.dart';

import '../entity/category.dart';


@dao
abstract class CategoryDao {
  @Query('SELECT * FROM categories')
  Future<List<Category>> getAllCategories();



    @insert
  Future<void> insertCategory(Category category);

  // Other CRUD operations for categories
}