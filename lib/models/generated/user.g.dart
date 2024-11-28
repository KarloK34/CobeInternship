// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[4] as String,
      fields[3] as String,
      fields[5] as bool,
      fields[6] as LeaveType?,
      fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.isOnline)
      ..writeByte(6)
      ..write(obj.currentLeaveType)
      ..writeByte(7)
      ..write(obj.isAdmin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['role'] as String,
      json['imageUrl'] as String,
      json['isOnline'] as bool,
      $enumDecodeNullable(_$LeaveTypeEnumMap, json['currentLeaveType']),
      json['isAdmin'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'role': instance.role,
      'isOnline': instance.isOnline,
      'currentLeaveType': _$LeaveTypeEnumMap[instance.currentLeaveType],
      'isAdmin': instance.isAdmin,
    };

const _$LeaveTypeEnumMap = {
  LeaveType.parental: 'parental',
  LeaveType.sick: 'sick',
  LeaveType.vacation: 'vacation',
};
