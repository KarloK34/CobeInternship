import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final updateRequestNotifierProvider = AutoDisposeNotifierProvider<UpdateRequestNotifier, RequestState>(() => UpdateRequestNotifier());

class UpdateRequestNotifier extends AutoDisposeNotifier<RequestState> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  @override
  RequestState build() {
    state = InitialState();
    return state;
  }

  void update(LeaveRequest request, LeaveRequestStatus status) {
    state = const LoadingState();
    request.status = status;
    final requestKey = requestBox.keys.firstWhere(
      (key) => requestBox.get(key)!.id == request.id,
      orElse: () => null,
    );

    if (requestKey == null) {
      state = const ErrorState();
      return;
    }
    requestBox.put(requestKey, request);
    state = SuccessState(request);
  }
}
