import 'package:first_project/providers/filtered_users_notifier_provider.dart';
import 'package:first_project/ui_components/user_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTiles extends ConsumerWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var users = ref.watch(filteredUsersNotifierProvider);
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
