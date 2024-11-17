import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReasonField extends StatelessWidget {
  const ReasonField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      margin: const EdgeInsets.only(left: 16.0, top: 12.0, right: 15.0),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (value) {
          context.read<FormStateCubit>().setReason(value);
        },
        maxLines: null,
        decoration: InputDecoration(
          hintText: 'Type something...',
          hintStyle: context.labelMedium!.copyWith(color: context.onBackgroundVariant),
          contentPadding: const EdgeInsets.only(left: 19, top: 14),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
