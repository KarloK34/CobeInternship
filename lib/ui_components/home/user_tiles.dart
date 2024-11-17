import 'package:first_project/cubits/filtered_users_cubit.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/home/user_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTiles extends StatelessWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredUsersCubit, List<User>>(
      builder: (context, users) {
        return Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: UserContainer(user: users[index]),
              );
            },
          ),
        );
      },
    );
  }
}
