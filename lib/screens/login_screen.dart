import 'package:first_project/ui_components/email_input_field.dart';
import 'package:first_project/ui_components/login_button.dart';
import 'package:first_project/ui_components/logo.dart';
import 'package:first_project/ui_components/password_input_field.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.loginBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 140),
          Logo(),
          SizedBox(height: 60),
          EmailInputField(),
          SizedBox(height: 17),
          PasswordInputField(),
          SizedBox(height: 28),
          LoginButton(),
          SizedBox(height: 22),
          Text(
            'Reset your password?',
            style: AppTextStyles.orange15,
          ),
        ],
      ),
    );
  }
}
