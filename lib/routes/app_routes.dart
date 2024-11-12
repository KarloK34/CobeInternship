import 'package:first_project/models/user.dart';
import 'package:first_project/screens/approved_requests_screen.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/screens/public_profile_page.dart';
import 'package:first_project/screens/request_board_screen.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  if (settings.name == LoginScreen.routeName) {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
  if (settings.name == HomeScreen.routeName) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
  if (settings.name == RequestBoardScreen.routeName) {
    return MaterialPageRoute(builder: (context) => const RequestBoardScreen());
  }
  if (settings.name == ApprovedRequestsScreen.routeName) {
    return MaterialPageRoute(builder: (context) => const ApprovedRequestsScreen());
  }
  if (settings.name == PublicProfilePage.routeName) {
    final user = settings.arguments as User;
    return MaterialPageRoute(
      builder: (context) => PublicProfilePage(user: user),
    );
  }
  return MaterialPageRoute(
    builder: (context) => const SplashScreen(),
  );
}
