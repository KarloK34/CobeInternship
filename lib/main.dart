import 'package:first_project/routes/app_routes.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: generateRoute,
    );
  }
}
