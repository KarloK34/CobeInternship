import 'package:first_project/providers/email_provider.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailTextField extends ConsumerStatefulWidget {
  const EmailTextField({
    super.key,
  });

  @override
  ConsumerState<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends ConsumerState<EmailTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailNotifier = ref.watch(emailNotifierProvider.notifier);
    ref.listen<String>(emailNotifierProvider, (previous, next) {
      _controller.text = next;
    });

    return FormBuilderTextField(
      controller: _controller,
      name: 'email',
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.regularTextColor),
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
        emailNotifier.updateEmail(value!);
      },
    );
  }
}
