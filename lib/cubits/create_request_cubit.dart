import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/models/leave_request_for_creation.dart';
import 'package:first_project/services/data_service.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/models/date.dart';
import 'package:first_project/models/date_range.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRequestCubit extends Cubit<RequestState> {
  FormStateCubit formStateCubit;
  AllRequestsCubit allRequestsCubit;
  PendingRequestCubit pendingRequestCubit;

  CreateRequestCubit(this.formStateCubit, this.allRequestsCubit, this.pendingRequestCubit) : super(InitialState());

  Future<void> createRequest() async {
    final form = formStateCubit.state;
    if (!form.isValid) {
      emit(const ErrorState());
      return;
    }
    emit(const LoadingState());

    final startDate = form.startDate;
    final endDate = form.endDate;
    final reason = form.reason;
    final type = form.leaveType;
    final visibility = form.visibility;
    final request = LeaveRequestForCreation(
      type,
      reason,
      visibility,
      DateRange(
        start: Date.fromDateTime(startDate!),
        end: Date.fromDateTime(endDate!),
      ),
    );
    try {
      await getIt<DataService>().createRequest(request.toJson());
      allRequestsCubit.loadRequests();
      emit(const SuccessState());
    } catch (e) {
      emit(const ErrorState());
    }
  }
}
