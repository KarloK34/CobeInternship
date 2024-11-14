import 'package:first_project/models/user.dart';
import 'package:first_project/screens/approved_requests_screen.dart';
import 'package:first_project/screens/create_request_screen.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/screens/public_profile_page.dart';
import 'package:first_project/screens/request_board_screen.dart';
import 'package:first_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case CreateRequestScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CreateRequestScreen());
    case RequestBoardScreen.routeName:
      return MaterialPageRoute(builder: (context) => const RequestBoardScreen());
    case ApprovedRequestsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ApprovedRequestsScreen());
    case PublicProfilePage.routeName:
      final user = settings.arguments as User;
      return MaterialPageRoute(
        builder: (context) => PublicProfilePage(user: user),
      );
    default:
      return null;
  }
}
