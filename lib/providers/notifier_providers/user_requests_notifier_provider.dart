import 'dart:async';

import 'package:first_project/models/leave_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final userRequestsNotifierProvider = AsyncNotifierProvider.autoDispose.family<UserRequestsNotifier, List<LeaveRequest>, int>(() => UserRequestsNotifier());

class UserRequestsNotifier extends AutoDisposeFamilyAsyncNotifier<List<LeaveRequest>, int> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  @override
  FutureOr<List<LeaveRequest>> build(int userId) async {
    return requestBox.values.where((request) => request.userId == userId).toList();
  }
}
