import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';

class FormState {
  final String reason;
  final LeaveType leaveType;
  final RequestVisibility visibility;
  final DateTime? startDate;
  final DateTime? endDate;

  FormState({
    this.reason = '',
    this.leaveType = LeaveType.parental,
    this.visibility = RequestVisibility.everyone,
    this.startDate,
    this.endDate,
  });

  bool get isValid => reason.isNotEmpty && startDate != null && endDate != null;

  FormState copyWith({
    String? reason,
    LeaveType? leaveType,
    RequestVisibility? visibility,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return FormState(
      reason: reason ?? this.reason,
      leaveType: leaveType ?? this.leaveType,
      visibility: visibility ?? this.visibility,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
