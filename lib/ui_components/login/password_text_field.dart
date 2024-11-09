import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/providers/password_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordTextField extends ConsumerStatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  ConsumerState<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends ConsumerState<PasswordTextField> {
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        name: 'password',
        obscureText: _isObscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: context.onBackgroundVariant),
          ),
          suffixIcon: IconButton(
            onPressed: _toggleVisibility,
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
              color: context.onBackgroundVariant,
            ),
          ),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        onChanged: (value) {
          if (value != null) {
            ref.read(passwordStateProvider.notifier).state = value;
          }
        });
  }
}
