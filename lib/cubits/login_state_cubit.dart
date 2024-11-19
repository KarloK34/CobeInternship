import 'package:first_project/cubits/singletons/user_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/models/email_and_password.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginStateCubit extends Cubit<RequestState> {
  LoginStateCubit() : super(const InitialState());

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

    _setStatus(const LoadingState());

    await Future.delayed(const Duration(seconds: 1));

    final userAccountExists = userCredentials.values.any((credential) => credential.password == password && credential.email == email);

    if (userAccountExists) {
      EmailAndPassword loggedInUserCredentials =
          userCredentials.values.firstWhere((credential) => credential.password == password && credential.email == email);
      User user = userCredentials.entries.firstWhere((element) => element.value == loggedInUserCredentials).key;
      getIt<UserCubit>().logIn(user);
      _setStatus(const SuccessState());
      _setStatus(const InitialState());
      return;
    }
    _setStatus(const ErrorState());
    _setStatus(const InitialState());
  }

  void _setStatus(RequestState loginState) {
    emit(loginState);
  }
}
