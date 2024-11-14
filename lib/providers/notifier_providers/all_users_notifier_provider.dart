import 'package:first_project/models/user.dart';
import 'package:first_project/providers/notifier_providers/approved_request_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final allUsersNotifierProvider = NotifierProvider<AllUsersNotifier, List<User>>(() => AllUsersNotifier());

class AllUsersNotifier extends Notifier<List<User>> {
  final userBox = Hive.box<User>('userBox');
  @override
  List<User> build() {
    _updateUsersLeaveType();
    return state = userBox.values.toList();
  }

  void _updateUsersLeaveType() {
    final approvedRequests = ref.watch(approvedRequestsNotifierProvider);
    final ongoingLeaves = approvedRequests.where(
      (req) {
        final currentDate = DateTime.now();
        return currentDate.isAfter(req.startDate) && currentDate.isBefore(req.endDate);
      },
    ).toList();
    for (var user in userBox.values) {
      user.currentLeaveType = null;
      for (var leave in ongoingLeaves) {
        if (leave.userId == user.id) user.currentLeaveType = leave.type;
      }
    }
  }
}
