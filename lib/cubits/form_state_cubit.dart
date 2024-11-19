import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/models/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormStateCubit extends Cubit<FormState> {
  FormStateCubit() : super(FormState());

  void setReason(String reason) {
    emit(state.copyWith(reason: reason));
  }

  void setLeaveType(LeaveType leaveType) {
    emit(state.copyWith(leaveType: leaveType));
  }

  void setVisibility(RequestVisibility visibility) {
    emit(state.copyWith(visibility: visibility));
  }

  void setDate({DateTime? startDate, DateTime? endDate}) {
    emit(state.copyWith(startDate: startDate, endDate: endDate));
  }
}
