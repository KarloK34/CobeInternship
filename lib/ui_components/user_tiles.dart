import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/models/email_and_password.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/user_container.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';

final users = [
  User('Karlo', 'Kraml', Role.Student, AppImages.dummyProfile, ConnectionStatus.Online),
  User('Stela', 'Kraml', Role.Student, AppImages.dummyProfile, ConnectionStatus.Online)
];

Map<User, EmailAndPassword> userCredentials = {
  users[0]: EmailAndPassword('karlo.kraml@gmail.com', 'karlo123'),
  users[1]: EmailAndPassword('stela.vlasic@gmail.com', 'stela123'),
};

class UserTiles extends StatelessWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

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
