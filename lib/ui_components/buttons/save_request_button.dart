import 'package:first_project/cubits/create_request_cubit.dart';
import 'package:first_project/cubits/form_state_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:first_project/ui_components/shareable/pop_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveRequestButton extends StatelessWidget {
  const SaveRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isValidInput = context.watch<FormStateCubit>().state.isValid;
    return BlocListener<CreateRequestCubit, RequestState>(
      listener: (context, state) {
        if (state == const SuccessState()) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => PopUpDialog(
              title: 'Request Created',
              message: 'Your request is created and it is currently being reviewed.',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
            ),
          );
        }
      },
      child: SizedBox(
        width: 96,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: isValidInput ? WidgetStatePropertyAll(context.secondary) : WidgetStatePropertyAll(context.secondary.withOpacity(0.5)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              )),
          onPressed: () {
            if (!isValidInput) return;
            context.read<CreateRequestCubit>().createRequest();
          },
          child: Text(
            'Save',
            style: context.labelMedium!.copyWith(color: context.onSecondary),
          ),
        ),
      ),
    );
  }
}
