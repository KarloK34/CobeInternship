import 'package:first_project/providers/passwords_provider.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordInputField extends ConsumerStatefulWidget {
  const PasswordInputField({super.key});

  @override
  ConsumerState<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends ConsumerState<PasswordInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(passwordProvider, (previous, next) {
      _controller.text = next;
    });
    return SizedBox(
      height: 97,
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Password",
            style: AppTextStyles.labelRegular,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value) => ref.read(passwordProvider.notifier).state = value,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.regularTextColor),
                  ),
                  suffixIcon: IconButton(
                      onPressed: _toggleVisibility,
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.regularTextColor,
                      ))),
              obscureText: _isObscure,
            ),
          ),
        ],
      ),
    );
  }
}
