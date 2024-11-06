import 'package:first_project/enums/login_status.dart';
import 'package:first_project/main.dart';
import 'package:first_project/providers/email_provider.dart';
import 'package:first_project/providers/login_status_notifier_provider.dart';
import 'package:first_project/providers/passwords_provider.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/login/login_failed_dialog.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
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
        onPressed: () async {
          if (formKey.currentState != null) {
            final bool isValid;
            isValid = formKey.currentState!.saveAndValidate();
            if (isValid && loginStatusNotifier.state == LoginStatus.Initial) {
              loginStatusNotifier.setStatus(LoginStatus.Loading);
              await Future.delayed(const Duration(seconds: 1));
              final userAccountExists = userCredentials.values.any(
                  (credential) => credential.password == ref.read(passwordStateProvider.notifier).state && credential.email == ref.read(emailNotifierProvider));
              if (userAccountExists) {
                loginStatusNotifier.setStatus(LoginStatus.Success);
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              } else {
                loginStatusNotifier.setStatus(LoginStatus.Failure);
                showDialog(
                  context: context,
                  builder: (context) => const LoginFailedDialog(),
                );
                loginStatusNotifier.setStatus(LoginStatus.Initial);
              }
            }
          }
        },
        child: loginStatusNotifier.state == LoginStatus.Loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text(
                'Login',
                style: AppTextStyles.title3Regular,
              ),
      ),
    );
  }
}