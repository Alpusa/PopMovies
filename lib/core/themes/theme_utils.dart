import 'package:flutter/material.dart';

/// Theme utilities
class ThemeUtils {
  /// Common method to create ThemeData from a ColorScheme
  static ThemeData theme(
    ColorScheme scheme,
  ) {
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
    );
  }
}
