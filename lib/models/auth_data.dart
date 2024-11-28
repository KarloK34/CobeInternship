import 'package:json_annotation/json_annotation.dart';
part 'generated/auth_data.g.dart';

@JsonSerializable()
class AuthData {
  final String email;
  final String password;

  AuthData({
    required this.email,
    required this.password,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
