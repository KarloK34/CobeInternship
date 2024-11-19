import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/approved_request_cubit.dart';
import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/cubits/update_request_status_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/screens/approved_requests_screen.dart';
import 'package:first_project/ui_components/request_board/admin_type_of_leave_tile.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:first_project/ui_components/shareable/toast.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestBoardScreen extends StatelessWidget {
  static const routeName = '/requestBoard';

  const RequestBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingRequests = context.watch<PendingRequestCubit>().state;
    return BlocListener<UpdateRequestStatusCubit, RequestState>(
      listener: (context, state) {
        if (state is SuccessState) {
          context.read<PendingRequestCubit>().refresh();
          context.read<ApprovedRequestCubit>().refresh();
          final request = state.data as LeaveRequest;
          final status = request.status;
          if (status != LeaveRequestStatus.pending) {
            CustomToast.show(
              context,
              status.name.capitalize(),
              status == LeaveRequestStatus.approved ? Icons.check : Icons.close,
              status == LeaveRequestStatus.approved ? context.tertiary : context.errorColor,
              () {
                context.read<UpdateRequestStatusCubit>().updateStatus(request, LeaveRequestStatus.pending);
              },
            );
          }
        }
      },
      child: Scaffold(
        floatingActionButton: const AddButton(),
        backgroundColor: context.background,
        appBar: AppBar(
          backgroundColor: context.background,
          leading: BackButton(color: context.primary),
          title: Text(
            'Request Board',
            style: context.titleMedium!.copyWith(color: context.titleColor),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 15),
            child: pendingRequests.isEmpty
                ? SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 71),
                        Text(
                          'No requests!',
                          style: context.bodyMedium,
                        ),
                        Text(
                          'You can take a time off.',
                          style: context.labelMedium!.copyWith(color: context.onBackgroundVariant),
                        ),
                        SizedBox(height: 34),
                        Image.asset(AppImages.doodle),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pending',
                            style: context.titleSmall!.copyWith(color: context.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(context, ApprovedRequestsScreen.routeName),
                              child: Text(
                                'See Approved',
                                style: context.labelSmall!.copyWith(color: context.secondary),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: pendingRequests.length,
                          itemBuilder: (context, index) {
                            return BlocBuilder<AllUsersCubit, List<User>>(
                              builder: (context, allUsers) {
                                final user = allUsers.firstWhere((user) => user.id == pendingRequests[index].userId);
                                return Column(
                                  children: [
                                    AdminTypeOfLeaveTile(
                                      request: pendingRequests[index],
                                      user: user,
                                    ),
                                    SizedBox(height: 12),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
