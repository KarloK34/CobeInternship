import 'package:first_project/enums/login_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStatusNotifierProvider = NotifierProvider<LoginStatusNotifier, LoginStatus>(() => LoginStatusNotifier());

class LoginStatusNotifier extends Notifier<LoginStatus> {
  @override
  LoginStatus get state => super.state;
  @override
  LoginStatus build() {
    return LoginStatus.Initial;
  }

  void setStatus(LoginStatus status) {
    state = status;
  }
}
