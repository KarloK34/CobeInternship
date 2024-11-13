import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/providers/state_providers/fab_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddButton extends ConsumerWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFabExtended = ref.watch(fabStateProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 48, right: 31),
      height: 54,
      width: 54,
      child: FloatingActionButton(
        backgroundColor: context.secondary,
        foregroundColor: context.onSecondary,
        shape: const CircleBorder(),
        heroTag: 'uniqueTag',
        onPressed: () {
          ref.read(fabStateProvider.notifier).state = !ref.read(fabStateProvider.notifier).state;
        },
        child: Icon(
          isFabExtended ? Icons.close : Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
