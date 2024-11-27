import 'package:first_project/cubits/email_cubit.dart';
import 'package:first_project/cubits/login_state_cubit.dart';
import 'package:first_project/cubits/password_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/shareable/pop_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const LoginButton(
    this.formKey, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginStateCubit, RequestState>(
      listener: (context, state) {
        if (state == const ErrorState()) {
          showDialog(
            context: context,
            builder: (context) => PopUpDialog(
              title: 'Login Failed',
              message: 'Invalid email or password. Please try again.',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        }
        if (state == const SuccessState()) Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.secondaryDim,
              context.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: context.transparent,
              shadowColor: context.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: () {
            final email = context.read<EmailCubit>().state;
            final password = context.read<PasswordCubit>().state;
            context.read<LoginStateCubit>().handleLogin(
                  formKey: formKey,
                  context: context,
                  email: email,
                  password: password,
                );
          },
          child: BlocBuilder<LoginStateCubit, RequestState>(
            builder: (context, state) {
              return state == const LoadingState()
                  ? CircularProgressIndicator(
                      color: context.onSecondary,
                    )
                  : Text(
                      'Login',
                      style: context.titleSmall!.copyWith(color: context.onSecondary),
                    );
            },
          ),
        ),
      ),
    );
  }
}
