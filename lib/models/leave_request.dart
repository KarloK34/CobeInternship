import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:hive/hive.dart';

part 'leave_request.g.dart';

@HiveType(typeId: 2)
class LeaveRequest {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final LeaveType type;
  @HiveField(3)
  final DateTime startDate;
  @HiveField(4)
  final DateTime endDate;
  @HiveField(5)
  final RequestVisibility visibility;
  @HiveField(6)
  final String reason;
  @HiveField(7)
  LeaveRequestStatus status;

  LeaveRequest(
    this.id,
    this.userId,
    this.startDate,
    this.endDate,
    this.type,
    this.visibility,
    this.reason,
    this.status,
  );

  int get numberOfDays => endDate.difference(startDate).inDays;
}
