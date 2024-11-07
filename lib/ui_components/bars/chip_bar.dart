import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/providers/filtered_users_notifier_provider.dart';
import 'package:first_project/providers/filters_notifier_provider.dart';
import 'package:first_project/ui_components/shareable/my_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipBar extends ConsumerWidget {
  static const List<String> chipLabels = [
    'Offline',
    'Online',
    'Parental',
    'Sick',
    'Vacation',
  ];

  const ChipBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filtersNotifierProvider);
    return SizedBox(
      height: 48,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipLabels.length,
          itemBuilder: (context, index) {
            final labelName = chipLabels[index];
            return GestureDetector(
              onTap: () {
                ref.read(filtersNotifierProvider.notifier).toggleFilter(labelName);
                ref.read(filteredUsersNotifierProvider.notifier).filterUsers();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MyChip(
                  chipType: ChipType.regular,
                  label: labelName,
                  borderRadius: 20,
                ),
              ),
            );
          }),
    );
  }
}
