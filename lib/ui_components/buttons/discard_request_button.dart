import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscardRequestButton extends ConsumerWidget {
  const DiscardRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 96,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(context.transparent),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            )),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Discard',
          style: context.labelMedium!.copyWith(color: context.secondary),
        ),
      ),
    );
  }
}
