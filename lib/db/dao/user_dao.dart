import 'package:floor/floor.dart';

import '../entity/users.dart';

@dao
abstract class UsersDao {
  @Query('SELECT * FROM users WHERE email = :email AND password = :password')
  Future<Users?> getUserByEmailPassword(String email, String password);

  @insert
  Future<void> insertUser(Users users);
}
