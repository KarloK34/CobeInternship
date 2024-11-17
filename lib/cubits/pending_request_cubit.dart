import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingRequestCubit extends Cubit<List<LeaveRequest>> {
  AllRequestsCubit allRequestsCubit;

  PendingRequestCubit(this.allRequestsCubit) : super(allRequestsCubit.state.where((request) => request.status == LeaveRequestStatus.pending).toList());

  void refresh() {
    emit(allRequestsCubit.state.where((request) => request.status == LeaveRequestStatus.pending).toList());
  }
}
