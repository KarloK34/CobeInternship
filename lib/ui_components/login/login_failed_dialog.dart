import 'package:first_project/providers/email_provider.dart';
import 'package:first_project/providers/passwords_provider.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFailedDialog extends ConsumerWidget {
  const LoginFailedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Center(
        child: Text(
          'Login Failed',
          style: AppTextStyles.title2Bold,
        ),
      ),
      content: const Text(
        'Invalid email or password. Please try again.',
        style: AppTextStyles.dialogText,
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.orangeGradient2),
                foregroundColor: AppColors.orangeGradient2,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            onPressed: () {
              ref.read(emailNotifierProvider.notifier).updateEmail('');
              ref.read(passwordStateProvider.notifier).state = '';
              Navigator.pop(context);
            },
            child: const Text('Okay'),
          ),
        ),
      ],
    );
  }
}
