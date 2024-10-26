import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/ui/my_chip.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class ChipBar extends StatefulWidget {
  const ChipBar({super.key});

  @override
  State<ChipBar> createState() => _ChipBarState();
}

class _ChipBarState extends State<ChipBar> {
  final Map<String, bool> chipLabels = {'Offline': false, 'Online': false, 'Parental': false, 'Sick': false, 'Vacation': false};

  void _toggle(String key) {
    setState(() {
      chipLabels.forEach((k, value) {
        chipLabels[k] = k == key ? !value : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = chipLabels.keys.toList();
    return SizedBox(
      height: 48,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipLabels.length,
          itemBuilder: (context, index) {
            final labelName = labels[index];
            return GestureDetector(
              onTap: () {
                _toggle(chipLabels.keys.toList()[index]);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MyChip(
                  chipType: ChipType.regular,
                  label: labelName,
                  color: chipLabels[labelName] ?? false ? AppColors.green : AppColors.backroundColor,
                  borderRadius: 20,
                ),
              ),
            );
          }),
    );
  }
}
