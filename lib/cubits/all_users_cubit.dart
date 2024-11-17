import 'package:first_project/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AllUsersCubit extends Cubit<List<User>> {
  final userBox = Hive.box<User>('userBox');

  AllUsersCubit() : super([]);

  void loadUsers() {
    emit(userBox.values.toList());
  }

  void addUser(User user) {
    userBox.add(user);
    loadUsers();
  }

  void deleteUser(User user) {
    final userKey = userBox.keys.firstWhere(
      (key) => userBox.get(key)!.id == user.id,
      orElse: () => null,
    );
    if (userKey == null) return;
    userBox.delete(userKey);
    loadUsers();
  }
}
