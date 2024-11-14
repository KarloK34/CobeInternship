import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/providers/notifier_providers/all_users_notifier_provider.dart';
import 'package:first_project/providers/notifier_providers/approved_request_notifier_provider.dart';
import 'package:first_project/providers/notifier_providers/pending_requests_notifier_provider.dart';
import 'package:first_project/providers/notifier_providers/update_request_notifier_provider.dart';
import 'package:first_project/screens/approved_requests_screen.dart';
import 'package:first_project/ui_components/request_board/admin_type_of_leave_tile.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:first_project/ui_components/toast.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestBoardScreen extends ConsumerWidget {
  static const routeName = '/requestBoard';

  const RequestBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      updateRequestNotifierProvider,
      (_, RequestState newState) {
        if (newState is SuccessState) {
          ref.read(pendingRequestsNotifierProvider.notifier).refresh();
          ref.read(approvedRequestsNotifierProvider.notifier).refresh();
          final request = newState.data as LeaveRequest;
          final status = request.status;
          if (status != LeaveRequestStatus.pending) {
            CustomToast.show(
              context,
              status.name.capitalize(),
              status == LeaveRequestStatus.approved ? Icons.check : Icons.close,
              status == LeaveRequestStatus.approved ? context.tertiary : context.errorColor,
              () {
                ref.read(updateRequestNotifierProvider.notifier).update(request, LeaveRequestStatus.pending);
              },
            );
          }
        }
      },
    );

    final pendingRequests = ref.watch(pendingRequestsNotifierProvider);
    final allUsers = ref.watch(allUsersNotifierProvider);
    return Scaffold(
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
                          final user = allUsers.firstWhere((user) => user.id == pendingRequests[index].userId);
                          return Column(
                            children: [
                              AdminTypeOfLeaveTile(
                                key: Key(pendingRequests[index].id),
                                request: pendingRequests[index],
                                user: user,
                              ),
                              SizedBox(height: 12),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
