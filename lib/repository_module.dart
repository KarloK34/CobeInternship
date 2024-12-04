import 'package:first_project/repositories/user_repository.dart';
import 'package:first_project/services/data_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @lazySingleton
  IUserRepository provideUserRepository(DataService dataService) => UserRepository(dataService);
}
