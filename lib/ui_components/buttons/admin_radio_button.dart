import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/providers/notifier_providers/form_state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminRadioButton extends StatelessWidget {
  const AdminRadioButton({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final visibility = ref.watch(formStateNotifierProvider.select((e) => e.visibility));
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(left: 17.0, top: 17.0, right: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: context.onSecondary,
      ),
      child: Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            top: 10.5,
            bottom: 10.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Only Admin',
                    style: context.labelMedium,
                  ),
                  Text(
                    'Text here',
                    style: context.labelSmall!.copyWith(color: context.onBackgroundVariant),
                  ),
                ],
              ),
              Radio(
                value: RequestVisibility.adminOnly,
                groupValue: visibility,
                onChanged: (RequestVisibility? value) {
                  ref.read(formStateNotifierProvider.notifier).setVisibility(value!);
                },
                fillColor: WidgetStatePropertyAll(context.primaryColorDark),
              )
            ],
          )),
    );
  }
}
