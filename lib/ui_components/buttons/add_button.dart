import 'package:first_project/cubits/fab_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 48, right: 31),
      height: 54,
      width: 54,
      child: BlocBuilder<FabCubit, bool>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: context.secondary,
            foregroundColor: context.onSecondary,
            shape: const CircleBorder(),
            heroTag: 'uniqueTag',
            onPressed: () {
              context.read<FabCubit>().toggle();
            },
            child: Icon(
              state ? Icons.close : Icons.add,
              size: 35,
            ),
          );
        },
      ),
    );
  }
}
