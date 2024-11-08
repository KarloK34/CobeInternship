import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get secondaryDim => Theme.of(this).colorScheme.secondaryFixedDim;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get onError => Theme.of(this).colorScheme.onError;

  Color get background => Theme.of(this).colorScheme.surface;

  Color get backgroundBright => Theme.of(this).colorScheme.surfaceBright;

  Color get backgroundDim => Theme.of(this).colorScheme.surfaceDim;

  Color get onBackground => Theme.of(this).colorScheme.onSurface;

  Color get onBackgroundVariant => Theme.of(this).colorScheme.onSurfaceVariant;

  Color get tertiary => Theme.of(this).colorScheme.tertiary;
}
