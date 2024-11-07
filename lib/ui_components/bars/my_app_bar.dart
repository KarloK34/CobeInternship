import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 44.0,
            width: 44.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.dummyProfile),
                fit: BoxFit.fitWidth,
              ),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              'Home',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          SizedBox(
            height: 44,
            width: 44,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.calendar_month,
                size: 20.0,
                color: AppColors.labelColorLightThemePrimary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 44,
            width: 44,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.notifications_none_outlined,
                size: 20.0,
                color: AppColors.labelColorLightThemePrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
