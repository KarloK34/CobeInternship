import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/providers/date_map_state_provider.dart';
import 'package:first_project/providers/leave_type_state_provider.dart';
import 'package:first_project/providers/reason_state_provider.dart';
import 'package:first_project/providers/request_visibility_state_provider.dart';
import 'package:first_project/providers/user_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class SaveRequestButton extends ConsumerWidget {
  const SaveRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 96,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(context.secondary),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            )),
        onPressed: () {
          final requestBox = Hive.box<LeaveRequest>('requestBox');
          final user = ref.read(userStateProvider);
          final startDate = ref.read(dateMapStateProvider).values.first;
          final endDate = ref.read(dateMapStateProvider).values.last;
          final type = ref.read(leaveTypeStateProvider);
          final visibility = ref.read(requestVisibilityStateProvider);
          final reason = ref.read(reasonStateProvider);
          if (user != null && startDate != null && endDate != null) {
            requestBox.add(LeaveRequest(user.id, startDate, endDate, type, visibility, reason, LeaveRequestStatus.pending));
          }
          Navigator.pop(context);
        },
        child: Text(
          'Save',
          style: context.labelMedium!.copyWith(color: context.onSecondary),
        ),
      ),
    );
  }
}
