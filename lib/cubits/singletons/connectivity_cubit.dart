import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ConnectivityCubit extends Cubit<bool> {
  late StreamSubscription<List<ConnectivityResult>> subscription;

  ConnectivityCubit() : super(true) {
    _initialize();
    subscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        if (result.contains(ConnectivityResult.none)) {
          emit(false);
        } else {
          emit(true);
        }
      },
    );
  }
  Future<void> _initialize() async {
    final hasConnection = await _hasInternetConnection();
    emit(hasConnection);
  }
}

Future<bool> _hasInternetConnection() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return !connectivityResult.contains(ConnectivityResult.none);
}
