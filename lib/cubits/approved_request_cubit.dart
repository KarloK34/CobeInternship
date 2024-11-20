import 'dart:async';

import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApprovedRequestCubit extends Cubit<List<LeaveRequest>> {
  AllRequestsCubit allRequestsCubit;

  late final StreamSubscription allRequestsSubscription;

  ApprovedRequestCubit(this.allRequestsCubit) : super(allRequestsCubit.state.where((request) => request.status == LeaveRequestStatus.approved).toList()) {
    allRequestsSubscription = allRequestsCubit.stream.listen(
      (allRequests) {
        emit(allRequestsCubit.state.where((request) => request.status == LeaveRequestStatus.approved).toList());
      },
    );
  }
}
