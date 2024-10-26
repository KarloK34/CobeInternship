import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/screens/public_profile_page.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:first_project/utilities/text_styles.dart';
import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  final User user;
  const UserContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Image profilePicture = user.profilePicture;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PublicProfilePage(user: user),
          )),
      child: Container(
        height: 96,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 56.0,
                  width: 56.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: profilePicture.image,
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                if (user.status == ConnectionStatus.Online)
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                        border: Border.all(
                          color: Colors.white,
                        )),
                  )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name} ${user.surname}',
                  style: TextStyles.heading2,
                ),
                const Text(
                  'Text here',
                  style: TextStyles.regular13,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
