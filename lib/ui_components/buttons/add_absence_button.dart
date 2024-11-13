import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';

class AddAbsenceButton extends StatelessWidget {
  const AddAbsenceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.secondary,
      foregroundColor: context.onSecondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      heroTag: 'uniqueTag2',
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Text(
          'Add Absence',
          style: context.labelMedium!.copyWith(color: context.onSecondary),
        ),
      ),
    );
  }
}
