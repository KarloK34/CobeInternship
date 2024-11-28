import 'package:first_project/repositories/abstractions/i_user_repository.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AllUsersCubit extends Cubit<RequestState<List<User>>> {
  final IUserRepository userRepository;

  AllUsersCubit(this.userRepository) : super(InitialState());

  void loadUsers() async {
    try {
      emit(const LoadingState());
      final users = await userRepository.fetchUsers();
      emit(SuccessState(users));
    } catch (e) {
      emit(const ErrorState());
    }
  }
}
