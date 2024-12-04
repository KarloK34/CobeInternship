import 'dart:async';

import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApprovedRequestCubit extends Cubit<List<LeaveRequest>> {
  AllRequestsCubit allRequestsCubit;

  late final StreamSubscription allRequestsSubscription;

  ApprovedRequestCubit(this.allRequestsCubit) : super([]) {
    _emitApprovedRequests();
    allRequestsSubscription = allRequestsCubit.stream.listen((state) => _emitApprovedRequests());
  }

  void _emitApprovedRequests() {
    final state = allRequestsCubit.state;
    final allRequests = state is SuccessState<List<LeaveRequest>> ? state.data : <LeaveRequest>[];
    final approvedRequests = allRequests!.where((request) => request.status == LeaveRequestStatus.approved).toList();

    emit(approvedRequests);
  }
}
