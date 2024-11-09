import 'package:first_project/enums/leave_request_status.dart';
import 'package:hive/hive.dart';

class LeaveRequestStatusAdapter extends TypeAdapter<LeaveRequestStatus> {
  @override
  final int typeId = 5;

  @override
  LeaveRequestStatus read(BinaryReader reader) {
    return LeaveRequestStatus.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, LeaveRequestStatus obj) {
    writer.writeInt(obj.index);
  }
}
