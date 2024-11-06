import 'package:first_project/enums/connection_status.dart';
import 'package:hive/hive.dart';

class ConnectionStatusAdapter extends TypeAdapter<ConnectionStatus> {
  @override
  final int typeId = 7;

  @override
  ConnectionStatus read(BinaryReader reader) {
    return ConnectionStatus.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, ConnectionStatus obj) {
    writer.writeInt(obj.index);
  }
}
