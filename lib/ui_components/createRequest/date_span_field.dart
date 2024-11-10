import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/date_map_state_provider.dart';
import 'package:first_project/ui_components/createRequest/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateSpanField extends ConsumerWidget {
  const DateSpanField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => const CustomDateRangePickerDialog(),
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
                (ref.watch(dateMapStateProvider).entries.first.value != null && ref.watch(dateMapStateProvider).entries.last.value != null)
                    ? '${DateFormat('dd/MM/yyyy').format(ref.watch(dateMapStateProvider).entries.first.value!.toLocal())} - ${DateFormat('dd/MM/yyyy').format(ref.watch(dateMapStateProvider).entries.last.value!.toLocal())}'
                    : 'Date',
                style: context.labelMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
