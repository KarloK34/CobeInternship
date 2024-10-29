import 'package:first_project/models/user.dart';
import 'package:first_project/screens/home_page.dart';
import 'package:first_project/screens/public_profile_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  if (settings.name == PublicProfilePage.routeName) {
    final user = settings.arguments as User;
    return MaterialPageRoute(
      builder: (context) => PublicProfilePage(user: user),
    );
  }
  return MaterialPageRoute(
    builder: (context) => const HomePage(),
  );
}
