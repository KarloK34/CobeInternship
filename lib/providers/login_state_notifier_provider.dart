import 'package:first_project/login_state.dart';
import 'package:first_project/models/email_and_password.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/providers/user_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateNotifierProvider = NotifierProvider<LoginStateNotifier, LoginState>(() => LoginStateNotifier());

class LoginStateNotifier extends Notifier<LoginState> {
  @override
  LoginState get state => super.state;
  @override
  LoginState build() {
    return const InitialState();
  }

  Future<void> handleLogin({
    required GlobalKey<FormBuilderState> formKey,
    required BuildContext context,
    required Map<User, EmailAndPassword> userCredentials,
    required String email,
    required String password,
  }) async {
    if (formKey.currentState == null) return;

    final bool isValid = formKey.currentState!.saveAndValidate();

    if (!(isValid && state == const InitialState())) return;

    setStatus(const LoadingState());

    await Future.delayed(const Duration(seconds: 1));

    final userAccountExists = userCredentials.values.any((credential) => credential.password == password && credential.email == email);

    if (userAccountExists) {
      EmailAndPassword loggedInUserCredentials = userCredentials.values.firstWhere((credential) => credential.password == password && credential.email == email);
      User userToLogIn = userCredentials.entries.firstWhere((element) => element.value == loggedInUserCredentials).key;
      ref.read(userStateProvider.notifier).state = userToLogIn;
      setStatus(const SuccessState());
      return;
    }
    setStatus(const ErrorState());
    setStatus(const InitialState());
  }

  void setStatus(LoginState loginState) {
    state = loginState;
  }
}
