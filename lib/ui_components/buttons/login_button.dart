import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/login_state.dart';
import 'package:first_project/main.dart';
import 'package:first_project/providers/email_state_provider.dart';
import 'package:first_project/providers/login_state_notifier_provider.dart';
import 'package:first_project/providers/password_state_provider.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/login/login_failed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  final GlobalKey<FormBuilderState> formKey;
  const LoginButton(
    this.formKey, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(loginStateNotifierProvider);
    final loginStatusNotifier = ref.read(loginStateNotifierProvider.notifier);
    var userCredentials = createUserCredentials();
    ref.listen(loginStateNotifierProvider, (LoginState? previousState, LoginState newState) {
      if (newState == const ErrorState()) showDialog(context: context, builder: (context) => const LoginFailedDialog());
      if (newState == const SuccessState()) Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return Container(
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
          final email = ref.read(emailStateProvider);
          final password = ref.read(passwordStateProvider);
          ref.read(loginStateNotifierProvider.notifier).handleLogin(
                formKey: formKey,
                context: context,
                userCredentials: userCredentials,
                email: email,
                password: password,
              );
        },
        child: loginStatusNotifier.state == const LoadingState()
            ? CircularProgressIndicator(
                color: context.onSecondary,
              )
            : Text(
                'Login',
                style: context.titleSmall!.copyWith(color: context.onSecondary),
              ),
      ),
    );
  }
}
