import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class UpdateRequestStatusCubit extends Cubit<RequestState> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  UpdateRequestStatusCubit() : super(const InitialState());

  void updateStatus(LeaveRequest request, LeaveRequestStatus status) {
    emit(const LoadingState());
    request.status = status;
    final requestKey = requestBox.keys.firstWhere(
      (key) => requestBox.get(key)!.id == request.id,
      orElse: () => null,
    );

    if (requestKey == null) {
      emit(const ErrorState());
      return;
    }
    requestBox.put(requestKey, request);
    emit(SuccessState(request));
  }
}
