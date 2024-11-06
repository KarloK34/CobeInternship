import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailNotifierProvider = NotifierProvider<EmailNotifier, String>(() => EmailNotifier());

class EmailNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void updateEmail(String email) {
    state = email;
  }
}
