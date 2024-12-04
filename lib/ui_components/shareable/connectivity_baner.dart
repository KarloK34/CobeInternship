import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:flutter/material.dart';

class ConnectivityBanner extends StatelessWidget {
  const ConnectivityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      color: context.errorColor,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 12),
      child: Center(
        child: Text(
          'No Internet Connection',
          style: context.labelMedium!.copyWith(color: context.onSecondary),
        ),
      ),
    );
  }
}
