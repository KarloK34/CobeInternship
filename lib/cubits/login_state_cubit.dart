import 'package:first_project/models/auth_data.dart';
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
    required AuthData authData,
  }) async {
    final formState = formKey.currentState;

    if (formState == null) return;

    final bool isFormValid = formState.saveAndValidate();
    final bool isInInitialState = state == const InitialState();
    final bool isInErrorState = state == const ErrorState();

    if (!(isFormValid && (isInInitialState || isInErrorState))) return;

    _setStatus(const LoadingState());

    try {
      final response = await getIt<AuthService>().signIn(authData.toJson());
      final user = response.user;

      final token = Token(response.accessToken, response.refreshToken, response.expiresAt);
      tokenBox.put(user.id, token);
      getIt<UserCubit>().logIn(user);
      _setStatus(const SuccessState());
    } catch (e) {
      _setStatus(const ErrorState());
    }
  }

  void _setStatus(RequestState loginState) {
    emit(loginState);
  }
}
