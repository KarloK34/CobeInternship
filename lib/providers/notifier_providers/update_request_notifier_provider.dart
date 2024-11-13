import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:first_project/ui_components/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final updateRequestNotifierProvider = NotifierProvider<UpdateRequestNotifier, RequestState>(() => UpdateRequestNotifier());

class UpdateRequestNotifier extends Notifier<RequestState> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  @override
  RequestState build() {
    state = InitialState();
    return state;
  }

  void update(LeaveRequest request, LeaveRequestStatus status, BuildContext context) {
    state = const LoadingState();
    request.status = status;
    final requestKey = requestBox.keys.firstWhere(
      (key) => requestBox.get(key)!.id == request.id,
      orElse: () => null,
    );

    if (requestKey != null) {
      requestBox.put(requestKey, request);
      state = const SuccessState();
      CustomToast.show(
        context,
        status.name.capitalize(),
        status == LeaveRequestStatus.approved ? Icons.check : Icons.close,
        status == LeaveRequestStatus.approved ? context.tertiary : context.errorColor,
        () {
          state = const LoadingState();
          request.status = LeaveRequestStatus.pending;
          requestBox.put(requestKey, request);
          state = const SuccessState();
        },
      );
      return;
    }
    state = const ErrorState();
  }
}
