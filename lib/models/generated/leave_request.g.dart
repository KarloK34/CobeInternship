// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../leave_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaveRequestAdapter extends TypeAdapter<LeaveRequest> {
  @override
  final int typeId = 2;

  @override
  LeaveRequest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeaveRequest(
      fields[0] as String,
      fields[1] as String,
      fields[2] as LeaveType,
      fields[3] as String,
      fields[4] as RequestVisibility,
      fields[5] as DateRange,
      fields[6] as LeaveRequestStatus,
    );
  }

  @override
  void write(BinaryWriter writer, LeaveRequest obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdById)
      ..writeByte(2)
      ..write(obj.leaveType)
      ..writeByte(3)
      ..write(obj.reason)
      ..writeByte(4)
      ..write(obj.viewType)
      ..writeByte(5)
      ..write(obj.dateRange)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaveRequestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveRequest _$LeaveRequestFromJson(Map<String, dynamic> json) => LeaveRequest(
      json['id'] as String,
      json['createdById'] as String,
      $enumDecode(_$LeaveTypeEnumMap, json['leaveType']),
      json['reason'] as String,
      $enumDecode(_$RequestVisibilityEnumMap, json['viewType']),
      DateRange.fromJson(json['dateRange'] as Map<String, dynamic>),
      $enumDecodeNullable(_$LeaveRequestStatusEnumMap, json['status']) ??
          LeaveRequestStatus.pending,
    );

Map<String, dynamic> _$LeaveRequestToJson(LeaveRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdById': instance.createdById,
      'leaveType': _$LeaveTypeEnumMap[instance.leaveType]!,
      'reason': instance.reason,
      'viewType': _$RequestVisibilityEnumMap[instance.viewType]!,
      'dateRange': instance.dateRange,
      'status': _$LeaveRequestStatusEnumMap[instance.status]!,
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

const _$LeaveRequestStatusEnumMap = {
  LeaveRequestStatus.approved: 'approved',
  LeaveRequestStatus.pending: 'pending',
  LeaveRequestStatus.rejected: 'rejected',
};
