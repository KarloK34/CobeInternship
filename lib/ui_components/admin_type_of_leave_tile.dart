import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/providers/approved_request_notifier_provider.dart';
import 'package:first_project/providers/pending_requests_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class AdminTypeOfLeaveTile extends ConsumerWidget {
  final LeaveRequest request;
  final User user;
  const AdminTypeOfLeaveTile({
    super.key,
    required this.request,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String formattedStartDate = DateFormat('MMM dd').format(request.startDate);
    String formattedEndDate = DateFormat('MMM dd').format(request.endDate);

    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: const EdgeInsets.only(top: 15, left: 14, bottom: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            request.type.name.capitalize(),
            style: context.bodyLarge,
          ),
          Text(
            '${request.numberOfDays} days ・ $formattedStartDate - $formattedEndDate',
            style: context.labelMedium!.copyWith(
              color: context.onBackgroundVariant,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(user.profilePicture),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 92),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(context.onSecondary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    request.status = LeaveRequestStatus.rejected;
                    ref.read(pendingRequestsNotifierProvider.notifier).removeRequest(request);
                    final requestBox = Hive.box<LeaveRequest>('requestBox');
                    final requestKey = requestBox.keys.firstWhere(
                      (key) => requestBox.get(key)!.id == request.id,
                      orElse: () => null,
                    );

                    if (requestKey != null) {
                      requestBox.put(requestKey, request);
                    }
                  },
                  child: Text(
                    'Reject',
                    style: context.labelMedium!.copyWith(color: context.secondary),
                  ),
                ),
                SizedBox(width: 14),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(context.secondary),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    request.status = LeaveRequestStatus.approved;
                    ref.read(approvedRequestsNotifierProvider.notifier).addRequest(request);
                    ref.read(pendingRequestsNotifierProvider.notifier).removeRequest(request);
                  },
                  child: Text(
                    'Approve',
                    style: context.labelMedium!.copyWith(color: context.onSecondary),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
