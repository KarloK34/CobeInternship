import 'package:first_project/cubits/singletons/user_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/screens/public_profile_page.dart';
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                PublicProfilePage.routeName,
                arguments: getIt<UserCubit>().state!,
              );
            },
            child: Container(
              height: 44.0,
              width: 44.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getIt<UserCubit>().state!.imageUrl),
                  fit: BoxFit.fitWidth,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              'Home',
              style: context.titleLargeBold!.copyWith(color: context.primary),
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
              child: Icon(
                Icons.calendar_month,
                size: 20.0,
                color: context.primary,
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
              fillColor: context.onSecondary,
              shape: const CircleBorder(),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 20.0,
                color: context.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
