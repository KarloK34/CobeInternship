import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/ui_components/create_request/leave_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaveTypeField extends StatelessWidget {
  const LeaveTypeField({super.key});

  @override
  Widget build(BuildContext context) {
    final leaveType = context.watch<FormStateCubit>().state.leaveType;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => LeaveTypeDialog(parentContext: context),
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
                leaveType.name.capitalize(),
                style: context.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
