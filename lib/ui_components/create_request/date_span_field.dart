import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/ui_components/create_request/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateSpanField extends StatelessWidget {
  const DateSpanField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (_) => CustomDateRangePickerDialog(parentContext: context),
      ),
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
                'Date',
                style: context.labelMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                (context.watch<FormStateCubit>().state.startDate != null && context.watch<FormStateCubit>().state.endDate != null)
                    ? '${DateFormat('dd/MM/yyyy').format(context.watch<FormStateCubit>().state.startDate!.toLocal())} - ${DateFormat('dd/MM/yyyy').format(context.watch<FormStateCubit>().state.endDate!.toLocal())}'
                    : 'Select Date',
                style: context.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
