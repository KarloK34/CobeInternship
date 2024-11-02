import 'package:first_project/providers/email_provider.dart';
import 'package:first_project/providers/loading_provider.dart';
import 'package:first_project/providers/passwords_provider.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/login_failed_dialog.dart';
import 'package:first_project/ui_components/user_tiles.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingStateProvider);

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
        onPressed: isLoading
            ? null
            : () async {
                ref.read(loadingStateProvider.notifier).state = true;

                await Future.delayed(const Duration(seconds: 2));

                if (userCredentials.values.any(
                    (credential) => credential.password == ref.read(passwordProvider.notifier).state && credential.email == ref.read(emailNotifierProvider))) {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => const LoginFailedDialog(),
                  );
                }
                ref.read(loadingStateProvider.notifier).state = false;
              },
        child: isLoading
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
