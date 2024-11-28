import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/filtered_users_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/home/user_container.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTiles extends StatelessWidget {
  const UserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AllUsersCubit>(),
      child: BlocBuilder<AllUsersCubit, RequestState<List<User>>>(
        builder: (context, state) {
          return switch (state) {
            ErrorState() => Text('Lol some error'),
            SuccessState() => _Content(),
            _ => Center(
                child: CircularProgressIndicator(),
              ),
          };
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredUsersCubit, List<User>>(
      builder: (context, users) {
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
      },
    );
  }
}
