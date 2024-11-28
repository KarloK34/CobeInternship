import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/token.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class Token {
  @HiveField(0)
  final String accessToken;
  @HiveField(1)
  final String refreshToken;
  @HiveField(2)
  final int expiresAt;

  Token(this.accessToken, this.refreshToken, this.expiresAt);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);

  bool get isExpired => DateTime.now().isAfter(DateTime.fromMicrosecondsSinceEpoch(expiresAt));
}
