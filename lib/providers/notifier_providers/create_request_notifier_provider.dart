import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/providers/notifier_providers/form_state_notifier_provider.dart';
import 'package:first_project/providers/notifier_providers/pending_requests_notifier_provider.dart';
import 'package:first_project/providers/state_providers/user_state_provider.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final createRequestNotifierProvider = AutoDisposeNotifierProvider<CreateRequestNotifier, RequestState>(() => CreateRequestNotifier());

class CreateRequestNotifier extends AutoDisposeNotifier<RequestState> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  @override
  RequestState build() {
    state = const InitialState();
    return state;
  }

  Future<void> createRequest() async {
    final form = ref.read(formStateNotifierProvider);
    if (!form.isValid) {
      state = const ErrorState();
      return;
    }
    state = const LoadingState();
    await Future.delayed(const Duration(seconds: 1));

    final user = ref.read(userStateProvider);
    final startDate = form.startDate;
    final endDate = form.endDate;
    final reason = form.reason;
    final type = form.leaveType;
    final visibility = form.visibility;
    requestBox.add(LeaveRequest(user!.id, startDate!, endDate!, type, visibility, reason, LeaveRequestStatus.pending));
    ref.read(pendingRequestsNotifierProvider.notifier).refresh();
    state = const SuccessState();
  }
}
