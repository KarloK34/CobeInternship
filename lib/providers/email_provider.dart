import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailNotifierProvider = NotifierProvider<EmailNotifier, String>(() => EmailNotifier());

class EmailNotifier extends Notifier<String> {
  @override
  String build() {
    return state;
  }

  void updateEmail(String email) {
    state = email;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
