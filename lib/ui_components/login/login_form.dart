import 'package:first_project/ui_components/login/email_text_field.dart';
import 'package:first_project/ui_components/login/login_button.dart';
import 'package:first_project/ui_components/login/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const EmailTextField(),
            const SizedBox(height: 17),
            const PasswordTextField(),
            const SizedBox(height: 28),
            LoginButton(_formKey),
          ],
        ),
      ),
    );
  }
}
