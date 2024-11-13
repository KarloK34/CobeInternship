import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/create_request_notifier_provider.dart';
import 'package:first_project/providers/form_state_notifier_provider.dart';
import 'package:first_project/request_creation_state.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/shareable/pop_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveRequestButton extends ConsumerWidget {
  const SaveRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(createRequestNotifierProvider, (_, RequestCreationState newState) {
      if (newState == const SuccessState()) {
        showDialog(
          context: context,
          builder: (context) => PopUpDialog(
            title: 'Request Created',
            message: 'Your request is created and it is currently being reviewed.',
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        );
      }
    });
    final isValidInput = ref.watch(formStateNotifierProvider.select((e) => e.isValid));
    return SizedBox(
      width: 96,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: isValidInput ? WidgetStatePropertyAll(context.secondary) : WidgetStatePropertyAll(context.secondary.withOpacity(0.5)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            )),
        onPressed: () {
          if (!isValidInput) return;
          ref.read(createRequestNotifierProvider.notifier).createRequest();
        },
        child: Text(
          'Save',
          style: context.labelMedium!.copyWith(color: context.onSecondary),
        ),
      ),
    );
  }
}
