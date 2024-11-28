import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/repositories/abstractions/i_leave_request_repository.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllRequestsCubit extends Cubit<RequestState<List<LeaveRequest>>> {
  final ILeaveRequestRepository leaveRequestRepository;
  final requestBox = HiveBoxes.request;

  AllRequestsCubit(this.leaveRequestRepository) : super(InitialState());

  void loadRequests() async {
    try {
      emit(const LoadingState());
      final requests = await leaveRequestRepository.getRequests();
      emit(SuccessState(requests));
    } catch (e) {
      emit(const ErrorState());
    }
  }
}
