import 'package:first_project/cubits/chip_labels_cubit.dart';
import 'package:first_project/cubits/selected_filters_cubit.dart';
import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/ui_components/shareable/my_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChipBar extends StatelessWidget {
  const ChipBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChipLabelsCubit()),
      ],
      child: BlocBuilder<ChipLabelsCubit, List<String>>(
        builder: (context, chipLabels) {
          return SizedBox(
            height: 48,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chipLabels.length,
                itemBuilder: (context, index) {
                  final labelName = chipLabels[index];
                  return GestureDetector(
                    onTap: () {
                      context.read<SelectedFiltersCubit>().toggleFilter(labelName);
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
        },
      ),
    );
  }
}
