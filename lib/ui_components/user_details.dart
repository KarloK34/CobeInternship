import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/shareable/my_chip.dart';
import 'package:first_project/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          Text(
            'Role ・ ${user.role.name}',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.regularTextColor,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyChip(
                chipType: ChipType.connection,
                connectionStatus: user.status,
              ),
              const SizedBox(width: 20),
              Text(
                user.currentLeaveType == null ? 'Available for work' : 'Unavailable',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.regularTextColor,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
