import 'package:first_project/utilities/app_images.dart';
import 'package:first_project/utilities/app_text_styles.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.splashLogo),
          const Text(
            'Hive',
            style: AppTextStyles.heading,
          ),
        ],
      ),
    );
  }
}
