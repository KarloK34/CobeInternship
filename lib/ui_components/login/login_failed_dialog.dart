import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/login_state.dart';
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
          ErrorState.title,
          style: context.titleMediumBold,
        ),
      ),
      content: Text(
        ErrorState.message,
        style: context.bodyMedium,
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: context.secondary),
                foregroundColor: context.secondary,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Okay'),
          ),
        ),
      ],
    );
  }
}
