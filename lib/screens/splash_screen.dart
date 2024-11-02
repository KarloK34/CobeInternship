import 'package:first_project/screens/login_screen.dart';
import 'package:first_project/ui_components/logo.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashScreen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(
        context,
        LoginScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.loginBackgroundColor,
      body: Logo(),
    );
  }
}
