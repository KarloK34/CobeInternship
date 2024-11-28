import 'package:first_project/enums/leave_type.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/user.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  String imageUrl;
  @HiveField(4)
  final String role;
  @HiveField(5)
  bool isOnline = false;
  @HiveField(6)
  LeaveType? currentLeaveType;
  @HiveField(7)
  final bool isAdmin;

  User(this.id, this.name, this.email, this.role, this.imageUrl, this.isOnline, this.currentLeaveType, this.isAdmin);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  void toggleConnectionStatus() {
    isOnline = !isOnline;
  }
}
