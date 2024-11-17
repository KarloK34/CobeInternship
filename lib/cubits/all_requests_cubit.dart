import 'package:first_project/models/leave_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class AllRequestsCubit extends Cubit<List<LeaveRequest>> {
  final requestBox = Hive.box<LeaveRequest>('requestBox');

  AllRequestsCubit() : super([]);

  void loadRequests() {
    emit(requestBox.values.toList());
  }

  void addRequest(LeaveRequest request) {
    requestBox.add(request);
    loadRequests();
  }

  void deleteRequest(LeaveRequest request) {
    final requestKey = requestBox.keys.firstWhere(
      (key) => requestBox.get(key)!.id == request.id,
      orElse: () => null,
    );
    if (requestKey == null) return;
    requestBox.delete(requestKey);
    loadRequests();
  }
}
