import 'package:first_project/models/user.dart';
import 'package:first_project/ui/add_button.dart';
import 'package:first_project/ui/type_of_leave_tile.dart';
import 'package:first_project/ui/user_details.dart';
import 'package:flutter/material.dart';

class PublicProfilePage extends StatelessWidget {
  static const routeName = '/publicProfile';

  final User user;
  const PublicProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
                    Image.asset(
                      user.profilePicture,
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
                      itemCount: user.requests.length,
                      itemBuilder: (context, index) {
                        return TypeOfLeaveTile(request: user.requests[index]);
                      }),
                )
              ],
            ),
            Positioned(
              top: 230,
              left: 0,
              child: UserDetails(user: user),
            ),
          ],
        ),
      ),
    );
  }
}