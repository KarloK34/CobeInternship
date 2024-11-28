import 'package:first_project/cubits/password_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController _controller = TextEditingController();

  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordCubit, String>(
      listener: (context, state) {
        _controller.text = state;
      },
      child: FormBuilderTextField(
          controller: _controller,
          name: 'password',
          obscureText: _isObscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: context.onSecondary,
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
              context.read<PasswordCubit>().updatePassword(value);
            }
          }),
    );
  }
}
