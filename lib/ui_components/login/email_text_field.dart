import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/providers/state_providers/email_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailTextField extends ConsumerWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderTextField(
      name: 'email',
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
          ref.read(emailStateProvider.notifier).state = value;
        }
      },
    );
  }
}
