import 'package:first_project/models/email_and_password.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/providers/state_providers/user_state_provider.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateNotifierProvider = NotifierProvider<LoginStateNotifier, RequestState>(() => LoginStateNotifier());

class LoginStateNotifier extends Notifier<RequestState> {
  @override
  RequestState get state => super.state;
  @override
  RequestState build() {
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
      EmailAndPassword loggedInUserCredentials =
          userCredentials.values.firstWhere((credential) => credential.password == password && credential.email == email);
      User userToLogIn = userCredentials.entries.firstWhere((element) => element.value == loggedInUserCredentials).key;
      ref.read(userStateProvider.notifier).state = userToLogIn;
      setStatus(const SuccessState());
      setStatus(const InitialState());
      return;
    }
    setStatus(const ErrorState());
    setStatus(const InitialState());
  }

  void setStatus(RequestState loginState) {
    state = loginState;
  }
}
