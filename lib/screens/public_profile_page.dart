import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/providers/notifier_providers/user_requests_notifier_provider.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/profile/type_of_leave_tile.dart';
import 'package:first_project/ui_components/profile/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PublicProfilePage extends ConsumerWidget {
  static const routeName = '/publicProfile';

  final User user;
  const PublicProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRequests = ref.watch(userRequestsNotifierProvider(user.id));
    return Scaffold(
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
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                if (userRequests.hasValue)
                  Expanded(
                    child: ListView.builder(
                      itemCount: userRequests.value!.length,
                      itemBuilder: (context, index) {
                        return TypeOfLeaveTile(request: userRequests.value![index]);
                      },
                    ),
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
    );
  }
}
