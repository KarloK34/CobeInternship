import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/ui_components/shareable/my_chip.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TypeOfLeaveTile extends StatelessWidget {
  final LeaveRequest request;
  const TypeOfLeaveTile({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    String formattedStartDate = DateFormat('MMM dd').format(request.startDate);
    String formattedEndDate = DateFormat('MMM dd').format(request.endDate);

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
      padding: const EdgeInsets.only(top: 15, left: 14, bottom: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            request.type.name,
            style: AppTextStyles.heading2,
          ),
          Text(
            '${request.numberOfDays} days ・ $formattedStartDate - $formattedEndDate',
            style: AppTextStyles.regular15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyChip(
                  chipType: ChipType.request,
                  requestStatus: request.status,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.buttonSecond,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                      color: AppColors.labelColorLightThemePrimary,
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors.buttonSecond),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
