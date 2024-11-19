import 'package:first_project/cubits/singletons/user_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppLifecycleCubit extends Cubit<void> {
  DateTime? _markTime;

  AppLifecycleCubit() : super(null);

  void onAppPaused() {
    _markTime = DateTime.now();
  }

  void onAppResumed(BuildContext context) {
    if (_markTime != null && DateTime.now().difference(_markTime!) >= const Duration(minutes: 1)) {
      getIt<UserCubit>().logOut();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
}
