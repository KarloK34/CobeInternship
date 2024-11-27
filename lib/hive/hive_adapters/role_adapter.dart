import 'package:first_project/enums/role.dart';
import 'package:hive/hive.dart';

class RoleAdapter extends TypeAdapter<Role> {
  @override
  final int typeId = 6;

  @override
  Role read(BinaryReader reader) {
    return Role.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, Role obj) {
    writer.writeInt(obj.index);
  }
}
