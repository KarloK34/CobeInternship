import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';

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
      child: FloatingActionButton(
        backgroundColor: AppColors.orangeGradient2,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          //TODO
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
