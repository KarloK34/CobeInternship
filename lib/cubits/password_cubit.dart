import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<String> {
  PasswordCubit() : super('');

  void updatePassword(String password) {
    emit(password);
  }
}
