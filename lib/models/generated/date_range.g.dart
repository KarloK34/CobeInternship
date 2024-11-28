// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../date_range.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateRangeAdapter extends TypeAdapter<DateRange> {
  @override
  final int typeId = 9;

  @override
  DateRange read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateRange(
      start: fields[0] as Date,
      end: fields[1] as Date,
    );
  }

  @override
  void write(BinaryWriter writer, DateRange obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.start)
      ..writeByte(1)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateRangeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateRange _$DateRangeFromJson(Map<String, dynamic> json) => DateRange(
      start: Date.fromJson(json['start'] as Map<String, dynamic>),
      end: Date.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateRangeToJson(DateRange instance) => <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
