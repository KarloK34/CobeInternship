import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/providers/form_state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaveTypeDialog extends ConsumerWidget {
  const LeaveTypeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: context.onSecondary,
      title: Text(
        'Type of Leave',
        style: context.titleMediumBold,
      ),
      content: SizedBox(
        width: 375,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: LeaveType.values.length,
            itemBuilder: (context, index) {
              return TextButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      side: WidgetStatePropertyAll(BorderSide(color: context.onBackgroundVariant))),
                  onPressed: () {
                    ref.read(formStateNotifierProvider.notifier).setLeaveType(LeaveType.values[index]);
                    Navigator.pop(context);
                  },
                  child: Text(
                    LeaveType.values[index].name.capitalize(),
                    style: context.labelMedium,
                  ));
            }),
      ),
    );
  }
}
