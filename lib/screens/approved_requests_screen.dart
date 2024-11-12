import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/approved_request_notifier_provider.dart';
import 'package:first_project/ui_components/shareable/add_button.dart';
import 'package:first_project/ui_components/approved_type_of_leave_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApprovedRequestsScreen extends ConsumerWidget {
  static const routeName = '/approvedRequests';
  const ApprovedRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approvedRequests = ref.watch(approvedRequestsNotifierProvider);

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
