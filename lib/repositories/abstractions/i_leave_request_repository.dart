import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/models/leave_request.dart';

abstract class ILeaveRequestRepository {
  Future<LeaveRequest> getRequest(String id);
  Future<List<LeaveRequest>> getRequests({String? userId, LeaveRequestStatus? status});
}
