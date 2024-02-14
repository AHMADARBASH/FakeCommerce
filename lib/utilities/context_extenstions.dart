import 'package:flutter/material.dart';

extension BuildContextEntension on BuildContext {
  get width => MediaQuery.of(this).size.width;
  get height => MediaQuery.of(this).size.height;
  get isTablet => MediaQuery.of(this).size.width >= 600;
  get primaryColor => Theme.of(this).colorScheme.primary;
  get secondaryColor => Theme.of(this).colorScheme.secondary;
  get tertiary => Theme.of(this).colorScheme.tertiary;
  get canvasColor => Theme.of(this).canvasColor;
}
