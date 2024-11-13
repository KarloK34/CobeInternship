import 'package:first_project/models/form_state.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final formStateNotifierProvider = AutoDisposeNotifierProvider<FormStateNotifier, FormState>(() => FormStateNotifier());

class FormStateNotifier extends AutoDisposeNotifier<FormState> {
  @override
  FormState build() {
    state = FormState();
    return state;
  }

  void setReason(String reason) {
    state = state.copyWith(reason: reason);
  }

  void setLeaveType(LeaveType leaveType) {
    state = state.copyWith(leaveType: leaveType);
  }

  void setVisibility(RequestVisibility visibility) {
    state = state.copyWith(visibility: visibility);
  }

  void setDate({DateTime? startDate, DateTime? endDate}) {
    state = state.copyWith(startDate: startDate, endDate: endDate);
  }
}
