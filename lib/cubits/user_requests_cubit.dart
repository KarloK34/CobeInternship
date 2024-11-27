import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/repositories/abstractions/i_leave_request_repository.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRequestsCubit extends Cubit<RequestState<List<LeaveRequest>>> {
  final requestBox = HiveBoxes.request;
  final ILeaveRequestRepository leaveRequestRepository;

  UserRequestsCubit(this.leaveRequestRepository) : super(const InitialState());

  void fetchRequests(String userId) async {
    try {
      emit(const LoadingState());
      final userRequests = await leaveRequestRepository.getRequests(userId: userId);
      emit(SuccessState(userRequests));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
