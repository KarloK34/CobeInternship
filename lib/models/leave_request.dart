import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/models/date_range.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/leave_request.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class LeaveRequest {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String createdById;
  @HiveField(2)
  final LeaveType leaveType;
  @HiveField(3)
  final String reason;
  @HiveField(4)
  final RequestVisibility viewType;
  @HiveField(5)
  final DateRange dateRange;
  @HiveField(6)
  LeaveRequestStatus status;

  LeaveRequest(this.id, this.createdById, this.leaveType, this.reason, this.viewType, this.dateRange, [this.status = LeaveRequestStatus.pending]);

  factory LeaveRequest.fromJson(Map<String, dynamic> json) => _$LeaveRequestFromJson(json);
  Map<String, dynamic> toJson() => {
        'leaveType': _$LeaveTypeEnumMap[leaveType]!,
        'reason': reason,
        'viewType': _$RequestVisibilityEnumMap[viewType]!,
        'dateRange': dateRange.toJson(),
      };

  int get numberOfDays => dateRange.end.dateAsDateTime.difference(dateRange.start.dateAsDateTime).inDays;
}
