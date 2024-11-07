import 'package:first_project/enums/login_status.dart';
import 'package:first_project/main.dart';
import 'package:first_project/providers/email_notifier_provider.dart';
import 'package:first_project/providers/login_status_notifier_provider.dart';
import 'package:first_project/providers/password_state_provider.dart';
import 'package:first_project/utilities/app_colors.dart';
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
    ref.watch(loginStatusNotifierProvider);
    final loginStatusNotifier = ref.read(loginStatusNotifierProvider.notifier);
    var userCredentials = createUserCredentials();

    return Container(
      width: 320,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.orangeGradient1,
            AppColors.orangeGradient2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: () {
          final email = ref.read(emailNotifierProvider);
          final password = ref.read(passwordStateProvider.notifier).state;
          ref.read(loginStatusNotifierProvider.notifier).handleLogin(
                formKey: formKey,
                context: context,
                userCredentials: userCredentials,
                email: email,
                password: password,
              );
        },
        child: loginStatusNotifier.state == LoginStatus.Loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                'Login',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
