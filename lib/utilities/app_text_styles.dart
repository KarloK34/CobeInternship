import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 28,
  );
  static const TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
  );
  static const TextStyle titleSmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );
  static const TextStyle labelLarge = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}
