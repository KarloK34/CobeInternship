import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/date_map_state_provider.dart';
import 'package:first_project/providers/leave_type_state_provider.dart';
import 'package:first_project/providers/reason_state_provider.dart';
import 'package:first_project/providers/request_visibility_state_provider.dart';
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
          ref.read(leaveTypeStateProvider.notifier).state = LeaveType.parental;
          ref.read(requestVisibilityStateProvider.notifier).state = RequestVisibility.everyone;
          ref.read(dateMapStateProvider.notifier).state = {
            'start': null,
            'end': null,
          };
          ref.read(reasonStateProvider.notifier).state = '';
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
