import 'package:first_project/models/user.dart';
import 'package:first_project/providers/user_provider.dart';
import 'package:first_project/screens/home_page.dart';
import 'package:first_project/screens/public_profile_page.dart';
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
      create: (_) => UserProvider(),
      child: MaterialApp(
        initialRoute: HomePage.routeName,
        onGenerateRoute: (settings) {
          if (settings.name == PublicProfilePage.routeName) {
            final user = settings.arguments as User;
            return MaterialPageRoute(
              builder: (context) => PublicProfilePage(user: user),
            );
          }
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
          );
        },
      ),
    );
  }
}
