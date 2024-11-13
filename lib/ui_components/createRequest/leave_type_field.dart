import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/providers/form_state_notifier_provider.dart';
import 'package:first_project/ui_components/createRequest/leave_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaveTypeField extends ConsumerWidget {
  const LeaveTypeField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formStateNotifierProvider);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const LeaveTypeDialog(),
        );
      },
      child: Container(
        height: 42,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(left: 17.0, right: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: context.onSecondary,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Type',
                style: context.labelMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                form.leaveType.name.capitalize(),
                style: context.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
