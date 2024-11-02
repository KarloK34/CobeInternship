import 'package:first_project/providers/email_provider.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailInputField extends ConsumerStatefulWidget {
  const EmailInputField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends ConsumerState<EmailInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _isValidEmail = true;

  @override
  Widget build(BuildContext context) {
    final emailNotifier = ref.watch(emailNotifierProvider.notifier);
    ref.listen<String>(emailNotifierProvider, (previous, next) {
      _controller.text = next;
    });

    return SizedBox(
      height: 97,
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: AppTextStyles.labelRegular,
          ),
          TextField(
            autocorrect: false,
            controller: _controller,
            onChanged: (value) {
              emailNotifier.updateEmail(value);
              setState(() {
                _isValidEmail = emailNotifier.isValidEmail(value);
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.regularTextColor),
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: _isValidEmail
                ? null
                : const Text(
                    'Please enter a valid email address.',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
          ),
        ],
      ),
    );
  }
}
