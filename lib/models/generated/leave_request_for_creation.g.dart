// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../leave_request_for_creation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaveRequestForCreationAdapter
    extends TypeAdapter<LeaveRequestForCreation> {
  @override
  final int typeId = 11;

  @override
  LeaveRequestForCreation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeaveRequestForCreation(
      fields[0] as LeaveType,
      fields[1] as String,
      fields[2] as RequestVisibility,
      fields[3] as DateRange,
    );
  }

  @override
  void write(BinaryWriter writer, LeaveRequestForCreation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.leaveType)
      ..writeByte(1)
      ..write(obj.reason)
      ..writeByte(2)
      ..write(obj.viewType)
      ..writeByte(3)
      ..write(obj.dateRange);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveRequestForCreationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequestForCreation _$LeaveRequestForCreationFromJson(
        Map<String, dynamic> json) =>
    LeaveRequestForCreation(
      $enumDecode(_$LeaveTypeEnumMap, json['leaveType']),
      json['reason'] as String,
      $enumDecode(_$RequestVisibilityEnumMap, json['viewType']),
      DateRange.fromJson(json['dateRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveRequestForCreationToJson(
        LeaveRequestForCreation instance) =>
    <String, dynamic>{
      'leaveType': _$LeaveTypeEnumMap[instance.leaveType]!,
      'reason': instance.reason,
      'viewType': _$RequestVisibilityEnumMap[instance.viewType]!,
      'dateRange': instance.dateRange,
    };

const _$LeaveTypeEnumMap = {
  LeaveType.parental: 'parental',
  LeaveType.sick: 'sick',
  LeaveType.vacation: 'vacation',
};

const _$RequestVisibilityEnumMap = {
  RequestVisibility.everyone: 'everyone',
  RequestVisibility.adminOnly: 'adminOnly',
};
