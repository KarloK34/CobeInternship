import 'package:first_project/models/leave_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final allRequestsProvider = Provider((ref) {
  final requestBox = Hive.box<LeaveRequest>('requestBox');
  return requestBox.values.toList();
});
