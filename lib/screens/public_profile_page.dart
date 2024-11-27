import 'package:first_project/ui_components/shareable/connectivity_indicator.dart';
import 'package:first_project/cubits/user_requests_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/repositories/leave_request_repository.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:first_project/ui_components/profile/type_of_leave_tile.dart';
import 'package:first_project/ui_components/profile/user_details.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PublicProfilePage extends StatelessWidget {
  static const routeName = '/publicProfile';

  final User user;
  const PublicProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRequestsCubit(getIt<LeaveRequestRepository>())..fetchRequests(user.id),
      child: Scaffold(
        floatingActionButton: const AddButton(),
        backgroundColor: context.background,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  ConnectivityIndicator(),
                  Stack(
                    children: [
                      Image.network(
                        user.imageUrl,
                        height: 372,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
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
                  BlocBuilder<UserRequestsCubit, RequestState<List<LeaveRequest>>>(
                    builder: (context, state) {
                      return switch (state) {
                        ErrorState() => Text('Lol some error'),
                        SuccessState() => Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 16, right: 4, bottom: 14),
                              itemCount: state.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    TypeOfLeaveTile(request: state.data![index]),
                                    SizedBox(height: 14),
                                  ],
                                );
                              },
                            ),
                          ),
                        _ => Center(
                            child: CircularProgressIndicator(),
                          ),
                      };
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
