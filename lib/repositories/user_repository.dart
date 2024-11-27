import 'package:first_project/cubits/singletons/connectivity_cubit.dart';
import 'package:first_project/services/data_service.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/repositories/abstractions/i_user_repository.dart';
import 'package:first_project/models/user.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class UserRepository implements IUserRepository {
  static const String timestampKey = "timestampKey";

  final DataService dataService;
  final ConnectivityCubit connectivityCubit = getIt<ConnectivityCubit>();

  UserRepository(this.dataService);

  @override
  Future<List<User>> fetchUsers() async {
    final timestamp = HiveBoxes.fetchUsersTimestamp.get(timestampKey) ?? 0;
    final milisecondsInDay = 86400000;
    final isCashFresh = DateTime.now().millisecondsSinceEpoch < (timestamp + milisecondsInDay);

    if (!isCashFresh) {
      return await _fetchFromNetwork();
    }
    return HiveBoxes.user.values.toList();
  }

  @override
  Future<User> getUser(String id) async {
    final hasInterneConnection = connectivityCubit.state;

    if (hasInterneConnection) {
      final user = await dataService.getUser(id);
      return user;
    } else {
      return HiveBoxes.user.values.firstWhere((user) => user.id == id);
    }
  }

  Future<List<User>> _fetchFromNetwork() async {
    final hasInterneConnection = connectivityCubit.state;

    if (hasInterneConnection) {
      final users = await dataService.getAllUsers();
      _cacheAllUsers(users);
      HiveBoxes.fetchUsersTimestamp.put(timestampKey, DateTime.now().millisecondsSinceEpoch);
      return users;
    } else {
      return HiveBoxes.user.values.toList();
    }
  }

  void _cacheAllUsers(List<User> users) {
    try {
      final userBox = HiveBoxes.user;

      for (var user in users) {
        userBox.put(user.id, user);
      }
    } catch (e) {
      // Do nothing
    }
  }
}
