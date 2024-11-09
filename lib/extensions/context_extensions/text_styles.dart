import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleLargeBold => titleLarge?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleMediumBold => titleMedium?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}
