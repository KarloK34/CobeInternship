import 'package:first_project/ui_components/shareable/connectivity_indicator.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/ui_components/buttons/admin_radio_button.dart';
import 'package:first_project/ui_components/buttons/discard_request_button.dart';
import 'package:first_project/ui_components/buttons/everyone_radio_button.dart';
import 'package:first_project/ui_components/buttons/save_request_button.dart';
import 'package:first_project/ui_components/create_request/date_span_field.dart';
import 'package:first_project/ui_components/create_request/leave_type_field.dart';
import 'package:first_project/ui_components/create_request/reason_field.dart';
import 'package:flutter/material.dart';

class CreateRequestScreen extends StatefulWidget {
  static const routeName = '/createRequest';

  const CreateRequestScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: AppBar(
        backgroundColor: context.background,
        leading: BackButton(
          color: context.primary,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Create Request',
          style: context.titleMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConnectivityIndicator(),
          const SizedBox(height: 44),
          const LeaveTypeField(),
          const SizedBox(height: 10),
          const DateSpanField(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              'Reason',
              style: context.bodyMedium,
            ),
          ),
          const ReasonField(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              'Who can view my request?',
              style: context.bodyMedium,
            ),
          ),
          EveryoneRadioButton(),
          AdminRadioButton(),
          const SizedBox(height: 107),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SaveRequestButton(),
              SizedBox(width: 37),
              DiscardRequestButton(),
            ],
          ),
        ],
      ),
    );
  }
}
