// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:first_project/cubits/all_users_cubit.dart' as _i60;
import 'package:first_project/cubits/singletons/app_lifecycle_cubit.dart'
    as _i647;
import 'package:first_project/cubits/singletons/connectivity_cubit.dart'
    as _i618;
import 'package:first_project/cubits/singletons/user_cubit.dart' as _i544;
import 'package:first_project/network_module.dart' as _i587;
import 'package:first_project/repositories/abstractions/i_user_repository.dart'
    as _i964;
import 'package:first_project/repositories/leave_request_repository.dart'
    as _i729;
import 'package:first_project/repositories/user_repository.dart' as _i408;
import 'package:first_project/repository_module.dart' as _i438;
import 'package:first_project/services/auth_service.dart' as _i216;
import 'package:first_project/services/data_service.dart' as _i801;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final repositoryModule = _$RepositoryModule();
    gh.singleton<_i618.ConnectivityCubit>(() => _i618.ConnectivityCubit());
    gh.singleton<_i544.UserCubit>(() => _i544.UserCubit());
    gh.singleton<_i647.AppLifecycleCubit>(() => _i647.AppLifecycleCubit());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.singleton<_i216.AuthService>(() => _i216.AuthService(gh<_i361.Dio>()));
    gh.singleton<_i801.DataService>(() => _i801.DataService(gh<_i361.Dio>()));
    gh.singleton<_i408.UserRepository>(
        () => _i408.UserRepository(gh<_i801.DataService>()));
    gh.singleton<_i729.LeaveRequestRepository>(
        () => _i729.LeaveRequestRepository(gh<_i801.DataService>()));
    gh.lazySingleton<_i964.IUserRepository>(
        () => repositoryModule.provideUserRepository(gh<_i801.DataService>()));
    gh.singleton<_i60.AllUsersCubit>(
        () => _i60.AllUsersCubit(gh<_i964.IUserRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i587.NetworkModule {}

class _$RepositoryModule extends _i438.RepositoryModule {}
