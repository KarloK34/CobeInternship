import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/role.dart';
import 'package:flutter/material.dart';

class User {
  final String name;
  final String surname;
  final Role role;
  Image profilePicture;
  ConnectionStatus _status = ConnectionStatus.Offline;

  ConnectionStatus get status => _status;
  set status(ConnectionStatus newStatus) {
    _status = newStatus;
  }

  void toggleConnectionStatus() {
    _status = _status == ConnectionStatus.Offline ? ConnectionStatus.Online : ConnectionStatus.Online;
  }

  User(this.name, this.surname, this.role, this.profilePicture, this._status);
}
