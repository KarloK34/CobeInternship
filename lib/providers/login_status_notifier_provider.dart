import 'package:first_project/enums/login_status.dart';
import 'package:first_project/models/email_and_password.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/login/login_failed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStatusNotifierProvider = NotifierProvider<LoginStatusNotifier, LoginStatus>(() => LoginStatusNotifier());

class LoginStatusNotifier extends Notifier<LoginStatus> {
  @override
  LoginStatus get state => super.state;
  @override
  LoginStatus build() {
    return LoginStatus.Initial;
  }

  Future<void> handleLogin({
    required GlobalKey<FormBuilderState> formKey,
    required BuildContext context,
    required Map<User, EmailAndPassword> userCredentials,
    required String email,
    required String password,
  }) async {
    if (formKey.currentState != null) {
      final bool isValid = formKey.currentState!.saveAndValidate();
      if (isValid && state == LoginStatus.Initial) {
        setStatus(LoginStatus.Loading);
        await Future.delayed(const Duration(seconds: 1));

        final userAccountExists = userCredentials.values.any((credential) => credential.password == password && credential.email == email);

        if (userAccountExists) {
          setStatus(LoginStatus.Success);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          setStatus(LoginStatus.Failure);
          showDialog(
            context: context,
            builder: (context) => const LoginFailedDialog(),
          );
          setStatus(LoginStatus.Initial);
        }
      }
    }
  }

  void setStatus(LoginStatus status) {
    state = status;
  }
}
