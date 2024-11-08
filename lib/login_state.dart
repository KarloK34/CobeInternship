sealed class LoginState {
  const LoginState();
}

class InitialState extends LoginState {
  const InitialState();
}

class LoadingState extends LoginState {
  const LoadingState();
}

class SuccessState extends LoginState {
  const SuccessState();
}

class ErrorState extends LoginState {
  static String title = 'Login failed';
  static String message = 'Invalid email or password. Please try again.';

  const ErrorState();
}
