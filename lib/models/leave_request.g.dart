// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request.dart';

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
      fields[0] as int,
      fields[2] as DateTime,
      fields[3] as DateTime,
      fields[1] as LeaveType,
      fields[4] as RequestVisibility,
      fields[5] as String,
      fields[6] as LeaveRequestStatus,
    );
  }

  @override
  void write(BinaryWriter writer, LeaveRequest obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.reason)
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
