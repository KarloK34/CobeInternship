import 'package:first_project/globals.dart';
import 'package:first_project/ui/user_container.dart';
import 'package:flutter/material.dart';

class UserTiles extends StatelessWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          UserContainer(user: dummyUsers[0]),
          const SizedBox(
            height: 20,
          ),
          UserContainer(user: dummyUsers[1]),
          const SizedBox(
            height: 20,
          ),
          UserContainer(
            user: dummyUsers[0],
          ),
          const SizedBox(
            height: 20,
          ),
          UserContainer(user: dummyUsers[1]),
          const SizedBox(
            height: 20,
          ),
          UserContainer(user: dummyUsers[0]),
        ],
      ),
    );
  }
}
