import 'package:first_project/notifiers/filtered_users_notifier.dart';
import 'package:first_project/ui/user_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTiles extends StatelessWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final users = context.watch<FilteredUsersNotifier>().filteredUsers;

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
  }
}
