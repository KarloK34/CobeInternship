import 'package:json_annotation/json_annotation.dart';
part 'generated/refresh_token.g.dart';

@JsonSerializable()
class RefreshToken {
  String token;

  RefreshToken(this.token);

  factory RefreshToken.fromJson(Map<String, dynamic> json) => _$RefreshTokenFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}
