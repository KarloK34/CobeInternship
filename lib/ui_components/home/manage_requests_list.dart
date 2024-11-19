import 'package:first_project/cubits/pending_request_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/screens/request_board_screen.dart';
import 'package:first_project/ui_components/profile/type_of_leave_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageRequestsList extends StatelessWidget {
  const ManageRequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingRequests = context.watch<PendingRequestCubit>().state;
    return SizedBox(
      height: pendingRequests.isEmpty ? 63 : 215,
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Manage requests',
                style: context.titleMediumBold,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RequestBoardScreen.routeName);
                },
                child: Text(
                  'See all',
                  style: context.labelSmall!.copyWith(color: context.secondary),
                ),
              ),
            ],
          ),
          if (pendingRequests.isNotEmpty) SizedBox(height: 14),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pendingRequests.length,
                    itemBuilder: (context, index) {
                      return TypeOfLeaveTile(request: pendingRequests[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
