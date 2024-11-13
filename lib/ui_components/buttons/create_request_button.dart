import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/screens/create_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateRequestButton extends ConsumerWidget {
  const CreateRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: context.secondary,
      foregroundColor: context.onSecondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      heroTag: 'uniqueTag1',
      onPressed: () {
        Navigator.pushNamed(context, CreateRequestScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Text(
          'Create Request',
          style: context.labelMedium!.copyWith(color: context.onSecondary),
        ),
      ),
    );
  }
}
