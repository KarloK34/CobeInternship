import 'package:first_project/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<User?> {
  UserCubit() : super(null);

  void logIn(User user) {
    emit(user);
  }

  void logOut() {
    emit(null);
  }
}
