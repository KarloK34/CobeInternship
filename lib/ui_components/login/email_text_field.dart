import 'package:first_project/cubits/email_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'email',
      decoration: InputDecoration(
        filled: true,
        fillColor: context.onSecondary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.onBackgroundVariant),
        ),
      ),
      autocorrect: false,
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ],
      ),
      onChanged: (value) {
        if (value != null) {
          context.read<EmailCubit>().updateEmail(value);
        }
      },
    );
  }
}
