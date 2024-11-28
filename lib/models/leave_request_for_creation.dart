import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/models/date_range.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/leave_request_for_creation.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class LeaveRequestForCreation {
  @HiveField(0)
  final LeaveType leaveType;
  @HiveField(1)
  final String reason;
  @HiveField(2)
  final RequestVisibility viewType;
  @HiveField(3)
  final DateRange dateRange;

  LeaveRequestForCreation(this.leaveType, this.reason, this.viewType, this.dateRange);

  factory LeaveRequestForCreation.fromJson(Map<String, dynamic> json) => _$LeaveRequestForCreationFromJson(json);
  Map<String, dynamic> toJson() => _$LeaveRequestForCreationToJson(this);

  int get numberOfDays => dateRange.end.dateAsDateTime.difference(dateRange.start.dateAsDateTime).inDays;
}
