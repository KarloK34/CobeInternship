import 'package:first_project/enums/leave_type.dart';
import 'package:hive/hive.dart';

class LeaveTypeAdapter extends TypeAdapter<LeaveType> {
  @override
  final int typeId = 3;

  @override
  LeaveType read(BinaryReader reader) {
    return LeaveType.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, LeaveType obj) {
    writer.writeInt(obj.index);
  }
}
