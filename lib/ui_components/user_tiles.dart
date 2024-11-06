import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/user_container.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserTiles extends StatelessWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box<User>('userBox');
    var users = userBox.values.toList();
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
