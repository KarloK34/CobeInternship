import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/providers/chip_labels_provider.dart';
import 'package:first_project/providers/selected_filters_notifier_provider.dart';
import 'package:first_project/ui_components/shareable/my_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChipBar extends ConsumerWidget {
  const ChipBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectedFiltersNotifierProvider);
    final chipLabels = ref.watch(chipLabelsProvider);
    return SizedBox(
      height: 48,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipLabels.length,
          itemBuilder: (context, index) {
            final labelName = chipLabels[index];
            return GestureDetector(
              onTap: () {
                ref.read(selectedFiltersNotifierProvider.notifier).toggleFilter(labelName);
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
