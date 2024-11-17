import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final String title;
  final String message;
  final void Function() onPressed;
  const PopUpDialog({
    required this.title,
    required this.message,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.onSecondary,
      title: Center(
        child: Text(
          title,
          style: context.titleMediumBold,
        ),
      ),
      content: Text(
        message,
        style: context.bodyMedium!.copyWith(color: context.primary.withOpacity(0.75)),
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: context.secondary),
                backgroundColor: context.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            onPressed: onPressed,
            child: Text(
              'Okay',
              style: context.labelSmall!.copyWith(color: context.secondary),
            ),
          ),
        ),
      ],
    );
  }
}
