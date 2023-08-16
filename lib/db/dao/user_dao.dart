import 'package:floor/floor.dart';

import '../entity/users.dart';

@dao
abstract class UsersDao {
  @Query('SELECT * FROM users WHERE email = :email AND password = :password')
  Future<Users?> getUserByEmailPassword(String email, String password);

  @Query('SELECT email FROM users')
  Future<List<String>> getAllUserEmails();

    @Query('SELECT * FROM users WHERE email = :email')
  Future<Users?> getUserByEmail(String email);

  // @ForeignKey(childColumns: childColumns, parentColumns: parentColumns, entity: entity)

  @Query('SELECT email FROM users WHERE email = :email')
  Future<String?> getEmailByEmail(String email);

  

  @insert
  Future<void> insertUser(Users users);
}
