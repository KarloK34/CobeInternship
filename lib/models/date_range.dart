import 'package:first_project/models/date.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/date_range.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class DateRange {
  @HiveField(0)
  final Date start;
  @HiveField(1)
  final Date end;

  DateRange({
    required this.start,
    required this.end,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) => _$DateRangeFromJson(json);
  Map<String, dynamic> toJson() => {
        "start": start.toJson(),
        "end": end.toJson(),
      };
}
