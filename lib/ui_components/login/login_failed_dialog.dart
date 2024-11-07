import 'package:first_project/providers/email_provider.dart';
import 'package:first_project/providers/passwords_provider.dart';
import 'package:first_project/utilities/app_colors.dart';
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
      title: Center(
        child: Text(
          'Login Failed',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      content: Text(
        'Invalid email or password. Please try again.',
        style: Theme.of(context).textTheme.bodyMedium,
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
