import 'package:first_project/cubits/email_cubit.dart';
import 'package:first_project/cubits/password_cubit.dart';
import 'package:first_project/extensions/context_extensions/colors.dart';
import 'package:first_project/extensions/context_extensions/text_styles.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.read<EmailCubit>().updateEmail("davorstajcertehnicka@gmail.com"); //just for testing
          context.read<PasswordCubit>().updatePassword("daca1234");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashLogo),
            Text(
              'Hive',
              style: context.titleLargeBold!.copyWith(color: context.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
