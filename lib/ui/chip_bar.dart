import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/notifiers/filters_notifier.dart';
import 'package:first_project/ui/my_chip.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChipBar extends StatelessWidget {
  static const List<String> chipLabels = [
    'Offline',
    'Online',
    'Parental',
    'Sick',
    'Vacation',
  ];

  const ChipBar({super.key});

  @override
  Widget build(BuildContext context) {
    FiltersNotifier filtersNotifier = context.watch<FiltersNotifier>();
    return SizedBox(
      height: 48,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipLabels.length,
          itemBuilder: (context, index) {
            final labelName = chipLabels[index];
            return GestureDetector(
              onTap: () {
                filtersNotifier.toggleFilter(labelName);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MyChip(
                  chipType: ChipType.regular,
                  label: labelName,
                  color: filtersNotifier.selectedFilters.contains(labelName) ? AppColors.green : AppColors.backroundColor,
                  borderRadius: 20,
                ),
              ),
            );
          }),
    );
  }
}
