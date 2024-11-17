import 'package:first_project/cubits/approved_request_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/ui_components/request_board/approved_type_of_leave_tile.dart';
import 'package:first_project/ui_components/buttons/add_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApprovedRequestsScreen extends StatelessWidget {
  static const routeName = '/approvedRequests';
  const ApprovedRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final approvedRequests = context.watch<ApprovedRequestCubit>().state;

    return Scaffold(
      floatingActionButton: const AddButton(),
      backgroundColor: context.background,
      appBar: AppBar(
        backgroundColor: context.background,
        leading: BackButton(color: context.primary),
        title: Text(
          'Request Board',
          style: context.titleMedium!.copyWith(color: context.titleColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'Approved',
                style: context.titleSmall!.copyWith(color: context.black),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: approvedRequests.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ApprovedTypeOfLeaveTile(request: approvedRequests[index]),
                        SizedBox(height: 12),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
