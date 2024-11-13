import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/notifier_providers/form_state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReasonField extends ConsumerWidget {
  const ReasonField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 136,
      margin: const EdgeInsets.only(left: 16.0, top: 12.0, right: 15.0),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (value) {
          ref.read(formStateNotifierProvider.notifier).setReason(value);
        },
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Type something...',
          hintStyle: context.labelMedium!.copyWith(color: context.onBackgroundVariant),
          contentPadding: const EdgeInsets.only(left: 19, top: 14),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
