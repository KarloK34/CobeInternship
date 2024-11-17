import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscardRequestButton extends StatelessWidget {
  const DiscardRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(context.transparent),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            )),
        onPressed: () {
          Navigator.pop(context);
          context.read<FormStateCubit>().reset();
        },
        child: Text(
          'Discard',
          style: context.labelMedium!.copyWith(color: context.secondary),
        ),
      ),
    );
  }
}
