import 'dart:async';

import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingRequestCubit extends Cubit<List<LeaveRequest>> {
  AllRequestsCubit allRequestsCubit;

  late final StreamSubscription allRequestsSubscription;

  PendingRequestCubit(this.allRequestsCubit) : super([]) {
    _emitPendingRequests();
    allRequestsSubscription = allRequestsCubit.stream.listen((state) => _emitPendingRequests());
  }

  void _emitPendingRequests() {
    final state = allRequestsCubit.state;
    final allRequests = state is SuccessState<List<LeaveRequest>> ? state.data : <LeaveRequest>[];
    final pendingRequests = allRequests!.where((request) => request.status == LeaveRequestStatus.pending).toList();

    emit(pendingRequests);
  }

  @override
  Future<void> close() {
    allRequestsSubscription.cancel();
    return super.close();
  }
}
