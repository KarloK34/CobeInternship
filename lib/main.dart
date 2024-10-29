import 'package:first_project/providers/user_notifier.dart';
import 'package:first_project/routes/app_routes.dart';
import 'package:first_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserNotifier(),
      child: const MaterialApp(
        initialRoute: HomePage.routeName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
