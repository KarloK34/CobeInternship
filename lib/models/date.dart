import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/date.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class Date {
  @HiveField(0)
  final int day;
  @HiveField(1)
  final int month;
  @HiveField(2)
  final int year;

  Date({
    required this.day,
    required this.month,
    required this.year,
  });

  Date.fromDateTime(DateTime dateTime)
      : day = dateTime.day,
        month = dateTime.month,
        year = dateTime.year;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
  Map<String, dynamic> toJson() => _$DateToJson(this);

  DateTime get dateAsDateTime => DateTime(year, month, day);
}
