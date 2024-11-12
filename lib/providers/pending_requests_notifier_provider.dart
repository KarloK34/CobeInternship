import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final pendingRequestsNotifierProvider = NotifierProvider<PendingRequestNotifier, List<LeaveRequest>>(() => PendingRequestNotifier());

class PendingRequestNotifier extends Notifier<List<LeaveRequest>> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  @override
  List<LeaveRequest> build() {
    state = requestBox.values.where((request) => request.status == LeaveRequestStatus.pending).toList();
    return state;
  }

  void removeRequest(LeaveRequest request) {
    state = state.where((req) => req != request).toList();
  }
}
