import 'package:first_project/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final allUsersNotifierProvider = NotifierProvider<AllUsersNotifier, List<User>>(() => AllUsersNotifier());

class AllUsersNotifier extends Notifier<List<User>> {
  final userBox = Hive.box<User>('userBox');
  @override
  List<User> build() {
    return state = userBox.values.toList();
  }
}
