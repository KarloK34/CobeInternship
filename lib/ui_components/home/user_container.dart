import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/screens/public_profile_page.dart';
import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  final User user;
  const UserContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        PublicProfilePage.routeName,
        arguments: user,
      ),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: context.onSecondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 56.0,
                  width: 56.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(user.imageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                if (user.isOnline)
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.tertiary,
                        border: Border.all(
                          color: context.onSecondary,
                        )),
                  )
              ],
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: context.bodyLarge,
                ),
                Text(
                  'Text here',
                  style: context.labelMedium!.copyWith(
                    fontSize: 13.0,
                    color: context.onBackgroundVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
