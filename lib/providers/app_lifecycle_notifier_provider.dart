import 'package:first_project/providers/user_notifier_provider.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLifecycleNotifierProvider = NotifierProvider<AppLifecycleNotifier, void>(() => AppLifecycleNotifier());

class AppLifecycleNotifier extends Notifier<void> {
  DateTime? _markTime;

  @override
  void build() {}

  void onAppPaused() {
    _markTime = DateTime.now();
  }

  void onAppResumed(BuildContext context) {
    if (_markTime != null && DateTime.now().difference(_markTime!) >= const Duration(minutes: 1)) {
      ref.read(userStateProvider.notifier).state = null;
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
}
