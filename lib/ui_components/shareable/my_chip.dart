import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/extensions/string_extensions.dart';
import 'package:first_project/providers/notifier_providers/selected_filters_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyChip extends ConsumerWidget {
  final ChipType chipType;
  final LeaveRequestStatus? requestStatus;
  final ConnectionStatus? connectionStatus;
  final String? label;
  final double borderRadius;

  const MyChip({super.key, required this.chipType, this.requestStatus, this.connectionStatus, this.label, this.borderRadius = 12.0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String chipLabel;
    Color chipColor;
    Color labelColor;
    Color borderColor;
    final regularTextColor = context.onBackgroundVariant;
    final backgroundColor = context.background;
    const white = Colors.white;

    switch (chipType) {
      case ChipType.request:
        chipLabel = requestStatus!.name.capitalize();
        chipColor = borderColor = _getRequestColor(requestStatus, context);
        labelColor = white;
        break;
      case ChipType.connection:
        chipLabel = connectionStatus!.name.capitalize();
        chipColor = _getConnectionColor(connectionStatus, context);
        labelColor = connectionStatus == ConnectionStatus.online ? white : regularTextColor;
        borderColor = connectionStatus == ConnectionStatus.online ? _getConnectionColor(connectionStatus, context) : regularTextColor;
        break;
      case ChipType.regular:
        chipLabel = label ?? 'Chip';
        chipColor =
            ref.watch(selectedFiltersNotifierProvider.select((e) => e.contains(chipLabel))) ? _getRegularChipColor(context, chipLabel) : backgroundColor;
        labelColor = borderColor = chipColor != backgroundColor ? white : regularTextColor;
        break;
    }

    return Chip(
      label: Text(
        chipLabel,
        style: context.labelSmall!.copyWith(color: labelColor),
      ),
      backgroundColor: chipColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor),
      ),
    );
  }

  Color _getRegularChipColor(BuildContext context, String label) {
    switch (label) {
      case 'Online':
        return context.tertiary;
      case 'Offline':
        return context.tertiaryContainer.withOpacity(0.4);
      case 'Parental':
        return context.secondary;
      case 'Vacation':
        return context.primaryContainer;
      case 'Sick':
        return context.errorContainer;
      default:
        return Colors.transparent;
    }
  }

  Color _getRequestColor(LeaveRequestStatus? requestStatus, BuildContext context) {
    switch (requestStatus) {
      case LeaveRequestStatus.approved:
        return context.tertiary;
      case LeaveRequestStatus.pending:
        return context.secondaryContainer;
      case LeaveRequestStatus.rejected:
        return context.secondary;
      default:
        return Colors.grey;
    }
  }

  Color _getConnectionColor(ConnectionStatus? connectionStatus, BuildContext context) {
    switch (connectionStatus) {
      case ConnectionStatus.online:
        return context.tertiary;
      case ConnectionStatus.offline:
        return Colors.white;
      default:
        return Colors.grey;
    }
  }
}
