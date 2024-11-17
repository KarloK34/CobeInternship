import 'package:first_project/cubits/user_cubit.dart';
import 'package:first_project/main.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
