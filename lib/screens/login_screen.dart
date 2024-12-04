import 'package:first_project/cubits/email_cubit.dart';
import 'package:first_project/cubits/login_state_cubit.dart';
import 'package:first_project/cubits/password_cubit.dart';
import 'package:first_project/ui_components/shareable/connectivity_indicator.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/ui_components/login/login_form.dart';
import 'package:first_project/ui_components/shareable/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EmailCubit()),
        BlocProvider(create: (_) => PasswordCubit()),
        BlocProvider(create: (_) => LoginStateCubit()),
      ],
      child: Scaffold(
        backgroundColor: context.backgroundBright,
        body: SafeArea(
          child: Column(
            children: [
              ConnectivityIndicator(),
              const SizedBox(height: 100),
              const Logo(),
              const SizedBox(height: 60),
              LoginForm(),
              const SizedBox(height: 22),
              Text(
                'Reset your password?',
                style: context.labelMedium!.copyWith(color: context.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
