import 'package:first_project/cubits/update_request_status_cubit.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminTypeOfLeaveTile extends StatelessWidget {
  final LeaveRequest request;
  final User user;
  const AdminTypeOfLeaveTile({
    super.key,
    required this.request,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    String formattedStartDate = DateFormat('MMM dd').format(request.dateRange.start.dateAsDateTime);
    String formattedEndDate = DateFormat('MMM dd').format(request.dateRange.end.dateAsDateTime);

    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: const EdgeInsets.only(top: 15, left: 14, bottom: 12, right: 12),
      decoration: BoxDecoration(
        color: context.onSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            request.leaveType.name.capitalize(),
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
                      image: NetworkImage(user.imageUrl),
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
                  onPressed: () {
                    context.read<UpdateRequestStatusCubit>().updateStatus(request, LeaveRequestStatus.rejected);
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
                    context.read<UpdateRequestStatusCubit>().updateStatus(request, LeaveRequestStatus.approved);
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
