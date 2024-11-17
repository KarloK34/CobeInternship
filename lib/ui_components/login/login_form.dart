import 'package:first_project/cubits/email_cubit.dart';
import 'package:first_project/cubits/login_state_cubit.dart';
import 'package:first_project/cubits/password_cubit.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/ui_components/login/email_text_field.dart';
import 'package:first_project/ui_components/buttons/login_button.dart';
import 'package:first_project/ui_components/login/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmailCubit()),
        BlocProvider(create: (context) => PasswordCubit()),
        BlocProvider(create: (context) => LoginStateCubit()),
      ],
      child: SizedBox(
        width: 320,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: context.labelMedium,
              ),
              const SizedBox(height: 7),
              const EmailTextField(),
              const SizedBox(height: 17),
              Text(
                'Password',
                style: context.labelMedium,
              ),
              const SizedBox(height: 7),
              const PasswordTextField(),
              const SizedBox(height: 28),
              LoginButton(_formKey),
            ],
          ),
        ),
      ),
    );
  }
}
