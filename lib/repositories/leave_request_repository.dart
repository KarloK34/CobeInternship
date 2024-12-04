import 'package:first_project/cubits/singletons/connectivity_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/services/data_service.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:injectable/injectable.dart';

abstract class ILeaveRequestRepository {
  Future<LeaveRequest> getRequest(String id);
  Future<List<LeaveRequest>> getRequests({String? userId, LeaveRequestStatus? status});
}

@Singleton()
class LeaveRequestRepository implements ILeaveRequestRepository {
  final DataService dataService;
  final ConnectivityCubit connectivityCubit = getIt<ConnectivityCubit>();

  LeaveRequestRepository(this.dataService);

  @override
  Future<List<LeaveRequest>> getRequests({String? userId, LeaveRequestStatus? status}) async {
    final hasInternetConnection = connectivityCubit.state;

    if (!hasInternetConnection) return HiveBoxes.request.values.toList();

    final requests = await dataService.getRequests(userId: userId, status: status);
    _cacheRequests(requests);
    return requests;
  }

  @override
  Future<LeaveRequest> getRequest(String id) async {
    final hasInternetConnection = connectivityCubit.state;

    if (!hasInternetConnection) return HiveBoxes.request.values.firstWhere((req) => req.id == id);

    final request = await dataService.getRequest(id);
    _cacheRequest(request);
    return request;
  }

  void _cacheRequest(LeaveRequest request) {
    try {
      final requestBox = HiveBoxes.request;
      requestBox.put(request.id, request);
    } catch (e) {
      // Do nothing
    }
  }

  void _cacheRequests(List<LeaveRequest> requests) {
    try {
      final requestBox = HiveBoxes.request;

      for (var req in requests) {
        requestBox.put(req.id, req);
      }
    } catch (e) {
      // Do nothing
    }
  }
}
