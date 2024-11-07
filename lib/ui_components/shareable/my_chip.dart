import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_fonts.dart';
import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final ChipType chipType;
  final LeaveRequestStatus? requestStatus;
  final ConnectionStatus? connectionStatus;
  final String? label;
  final Color? color;
  final double borderRadius;

  const MyChip({super.key, required this.chipType, this.requestStatus, this.connectionStatus, this.label, this.color, this.borderRadius = 12.0});

  @override
  Widget build(BuildContext context) {
    String chipLabel;
    Color chipColor;
    Color labelColor;
    Color borderColor;

    switch (chipType) {
      case ChipType.request:
        chipLabel = requestStatus!.name;
        chipColor = borderColor = _getRequestColor(requestStatus);
        labelColor = Colors.white;
        break;
      case ChipType.connection:
        chipLabel = connectionStatus!.name;
        chipColor = _getConnectionColor(connectionStatus);
        labelColor = connectionStatus == ConnectionStatus.Online ? Colors.white : AppColors.regularTextColor;
        borderColor = connectionStatus == ConnectionStatus.Online ? _getConnectionColor(connectionStatus) : AppColors.regularTextColor;
        break;
      case ChipType.regular:
        chipLabel = label ?? 'Chip';
        chipColor = color ?? Colors.white;
        labelColor = borderColor = color == AppColors.green ? Colors.white : AppColors.regularTextColor;
        break;
    }

    return Chip(
      label: Text(chipLabel),
      labelStyle: TextStyle(
        fontFamily: AppFonts.filsonPro,
        color: labelColor,
      ),
      backgroundColor: chipColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor),
      ),
    );
  }

  Color _getRequestColor(LeaveRequestStatus? requestStatus) {
    switch (requestStatus) {
      case LeaveRequestStatus.Approved:
        return AppColors.green;
      case LeaveRequestStatus.Pending:
        return AppColors.yellow;
      case LeaveRequestStatus.Rejected:
        return AppColors.orangeGradient2;
      default:
        return Colors.grey;
    }
  }

  Color _getConnectionColor(ConnectionStatus? connectionStatus) {
    switch (connectionStatus) {
      case ConnectionStatus.Online:
        return AppColors.green;
      case ConnectionStatus.Offline:
        return Colors.white;
      default:
        return Colors.grey;
    }
  }
}
