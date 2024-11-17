import 'package:first_project/cubits/all_requests_cubit.dart';
import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/cubits/user_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/main.dart';
import 'package:first_project/models/leave_request.dart';
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
    await Future.delayed(const Duration(seconds: 1));

    final user = getIt<UserCubit>().state;
    final startDate = form.startDate;
    final endDate = form.endDate;
    final reason = form.reason;
    final type = form.leaveType;
    final visibility = form.visibility;
    allRequestsCubit.addRequest(LeaveRequest(user!.id, startDate!, endDate!, type, visibility, reason, LeaveRequestStatus.pending));
    pendingRequestCubit.refresh();
    emit(const SuccessState());
    formStateCubit.reset();
  }
}
