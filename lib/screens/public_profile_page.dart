import 'package:first_project/enums/chip_type.dart';
import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/request_status.dart';
import 'package:first_project/globals.dart';
import 'package:first_project/models/request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui/add_button.dart';
import 'package:first_project/ui/my_chip.dart';
import 'package:first_project/ui/type_of_leave_tile.dart';
import 'package:first_project/utilities/text_styles.dart';
import 'package:flutter/material.dart';

class PublicProfilePage extends StatelessWidget {
  final User user;
  const PublicProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List<Request> userRequests = dummyRequests.where((request) => request.creator == user).toList();
    dummyRequests[0].status = RequestStatus.Approved;

    return Scaffold(
      floatingActionButton: const AddButton(),
      backgroundColor: const Color(0xFFE9ECF4),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image(
                      image: user.profilePicture.image,
                      height: 372,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BackButton(
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: userRequests.length,
                      itemBuilder: (context, index) {
                        return TypeOfLeaveTile(request: userRequests[index]);
                      }),
                )
              ],
            ),
            Positioned(
              top: 230,
              left: 0,
              child: Container(
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
                      style: TextStyles.heading,
                    ),
                    Text(
                      'Role ・ ${user.role.name}',
                      style: TextStyles.regular15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyChip(
                          chipType: ChipType.connection,
                          connectionStatus: ConnectionStatus.Offline,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          user.status.name == ConnectionStatus.Offline.name ? 'Unavailable' : 'Available',
                          style: TextStyles.regular15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
