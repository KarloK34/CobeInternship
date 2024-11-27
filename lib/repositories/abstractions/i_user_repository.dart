import 'package:first_project/models/user.dart';

abstract class IUserRepository {
  Future<List<User>> fetchUsers();
  Future<User> getUser(String id);
}
