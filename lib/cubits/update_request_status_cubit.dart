import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/hive/hive_boxes.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/services/data_service.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateRequestStatusCubit extends Cubit<RequestState> {
  final AllRequestsCubit allRequestsCubit;
  final requestBox = HiveBoxes.request;

  UpdateRequestStatusCubit(this.allRequestsCubit) : super(const InitialState());

  void updateStatus(LeaveRequest request, LeaveRequestStatus status) async {
    emit(const LoadingState());
    final updateRequest = {"status": status.name};
    try {
      await getIt<DataService>().updateStatus(request.id, updateRequest);
      allRequestsCubit.loadRequests();
      emit(SuccessState(await getIt<DataService>().getRequest(request.id)));
    } catch (e) {
      emit(const ErrorState());
    }
  }
}
