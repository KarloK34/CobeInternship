import 'package:first_project/models/leave_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class UserRequestsCubit extends Cubit<List<LeaveRequest>> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  UserRequestsCubit() : super([]);

  void fetchRequests(int userId) {
    final requests = requestBox.values.where((request) => request.userId == userId).toList();
    emit(requests);
  }
}
