import 'package:first_project/services/auth_service.dart';
import 'package:first_project/cubits/singletons/user_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/models/token.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginStateCubit extends Cubit<RequestState> {
  final tokenBox = HiveBoxes.token;
  final userBox = HiveBoxes.user;

  LoginStateCubit() : super(const InitialState());

  Future<void> handleLogin({
    required GlobalKey<FormBuilderState> formKey,
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (formKey.currentState == null) return;
    final bool isValid = formKey.currentState!.saveAndValidate();

    if (!(isValid && state == const InitialState())) return;

    _setStatus(const LoadingState());

    final credentials = {'email': email, 'password': password};

    try {
      final response = await getIt<AuthService>().signIn(credentials);
      final user = response.user;

      final token = Token(response.accessToken, response.refreshToken, response.expiresAt);
      tokenBox.put(user.id, token);
      getIt<UserCubit>().logIn(user);
      _setStatus(const SuccessState());
      _setStatus(const InitialState());
    } catch (e) {
      _setStatus(const ErrorState());
      _setStatus(const InitialState());
    }
  }

  void _setStatus(RequestState loginState) {
    emit(loginState);
  }
}
