import 'package:first_project/ui_components/login/login_form.dart';
import 'package:first_project/ui_components/shareable/logo.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 140),
          const Logo(),
          const SizedBox(height: 60),
          LoginForm(),
          const SizedBox(height: 22),
          Text(
            'Reset your password?',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.orangeGradient2),
          ),
        ],
      ),
    );
  }
}
