import 'package:first_project/cubits/user_requests_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/profile/type_of_leave_tile.dart';
import 'package:first_project/ui_components/profile/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicProfilePage extends StatelessWidget {
  static const routeName = '/publicProfile';

  final User user;
  const PublicProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRequestsCubit()..fetchRequests(user.id),
      child: Scaffold(
        floatingActionButton: const AddButton(),
        backgroundColor: context.background,
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
                          color: context.onSecondary,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  BlocBuilder<UserRequestsCubit, List<LeaveRequest>>(
                    builder: (context, userRequests) {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 16, right: 4, bottom: 14),
                          itemCount: userRequests.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                TypeOfLeaveTile(request: userRequests[index]),
                                SizedBox(height: 14),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
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
      ),
    );
  }
}
