import 'package:first_project/enums/request_visibility.dart';
import 'package:hive/hive.dart';

class RequestVisibilityAdapter extends TypeAdapter<RequestVisibility> {
  @override
  final int typeId = 4;

  @override
  RequestVisibility read(BinaryReader reader) {
    return RequestVisibility.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, RequestVisibility obj) {
    writer.writeInt(obj.index);
  }
}
