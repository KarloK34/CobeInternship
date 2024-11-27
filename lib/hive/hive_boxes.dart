import 'dart:convert';
import 'dart:math';

import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/token.dart';
import 'package:first_project/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static const _encryptionKeyStorageKey = 'encryptionKey';
  static final _secureStorage = FlutterSecureStorage();

  static Box<Token>? _tokenBox;
  static Box<User>? _userBox;
  static Box<LeaveRequest>? _requestBox;
  static Box<int>? _fetchUsersTimestampBox;

  static late HiveAesCipher _aesCipher;

  static Future<void> init() async {
    final key = await _getOrGenerateEncryptionKey();
    _aesCipher = HiveAesCipher(key);

    _tokenBox ??= await Hive.openBox<Token>(
      'tokenBox',
      encryptionCipher: _aesCipher,
    );
    _userBox ??= await Hive.openBox<User>(
      'userBox',
      encryptionCipher: _aesCipher,
    );
    _requestBox ??= await Hive.openBox<LeaveRequest>(
      'requestBox',
      encryptionCipher: _aesCipher,
    );
    _fetchUsersTimestampBox ??= await Hive.openBox<int>(
      'fetchUsersTimestampBox',
      encryptionCipher: _aesCipher,
    );
  }

  static Future<void> deleteBoxesFromDisk() async {
    await token.deleteFromDisk();
    await user.deleteFromDisk();
    await request.deleteFromDisk();
    await fetchUsersTimestamp.deleteFromDisk();
  }

  static Future<void> clearBoxes() async {
    await token.clear();
    await user.clear();
    await request.clear();
    await fetchUsersTimestamp.clear();
  }

  static Box<Token> get token => _tokenBox!;
  static Box<User> get user => _userBox!;
  static Box<LeaveRequest> get request => _requestBox!;
  static Box<int> get fetchUsersTimestamp => _fetchUsersTimestampBox!;

  static Future<List<int>> _getOrGenerateEncryptionKey() async {
    final key = await _secureStorage.read(key: _encryptionKeyStorageKey);
    if (key != null) {
      return base64Decode(key);
    }

    final newKey = List<int>.generate(32, (i) => Random.secure().nextInt(256));
    await _secureStorage.write(
      key: _encryptionKeyStorageKey,
      value: base64Encode(newKey),
    );
    return newKey;
  }
}
