import 'package:first_project/ui_components/shareable/connectivity_baner.dart';
import 'package:first_project/cubits/singletons/connectivity_cubit.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityIndicator extends StatelessWidget {
  const ConnectivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, bool>(
      bloc: getIt<ConnectivityCubit>(),
      builder: (context, isOnline) {
        return isOnline ? SizedBox.shrink() : ConnectivityBanner();
      },
    );
  }
}
