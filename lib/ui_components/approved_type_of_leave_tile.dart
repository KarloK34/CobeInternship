import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/ui_components/shareable/my_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApprovedTypeOfLeaveTile extends StatelessWidget {
  final LeaveRequest request;
  const ApprovedTypeOfLeaveTile({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
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
                MyChip(
                  chipType: ChipType.request,
                  requestStatus: LeaveRequestStatus.approved,
                  borderRadius: 8,
                ),
                SizedBox(width: 166),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: context.backgroundDim,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: IconButton(
                        iconSize: 19,
                        color: context.primary,
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(context.backgroundDim),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
