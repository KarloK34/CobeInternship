import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/role.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String surname;
  @HiveField(3)
  final Role role;
  @HiveField(4)
  String profilePicture;
  @HiveField(5)
  ConnectionStatus status = ConnectionStatus.offline;
  @HiveField(6)
  LeaveType? currentLeaveType;

  User(
    this.id,
    this.name,
    this.surname,
    this.role,
    this.profilePicture,
    this.status,
  );

  void toggleConnectionStatus() {
    status = status == ConnectionStatus.offline ? ConnectionStatus.online : ConnectionStatus.online;
  }
}
