import 'package:flutter/material.dart';
import 'light_schemes.dart';
import 'dark_schemes.dart';
import 'theme_utils.dart';

/// Class for manage custom themes
class MaterialTheme {
  const MaterialTheme();

  /// Theme for Light Scheme
  ThemeData light() {
    return ThemeUtils.theme(LightSchemes.lightScheme());
  }

  /// Theme for Light Medium Contrast Scheme
  ThemeData lightMediumContrast() {
    return ThemeUtils.theme(LightSchemes.lightMediumContrastScheme());
  }

  /// Theme for Light High Contrast Scheme
  ThemeData lightHighContrast() {
    return ThemeUtils.theme(LightSchemes.lightHighContrastScheme());
  }

  /// Theme for Dark Scheme
  ThemeData dark() {
    return ThemeUtils.theme(DarkSchemes.darkScheme());
  }

  /// Theme for Medium dark contrast scheme
  ThemeData darkMediumContrast() {
    return ThemeUtils.theme(DarkSchemes.darkMediumContrastScheme());
  }

  /// Theme for Dark High Contrast Scheme
  ThemeData darkHighContrast() {
    return ThemeUtils.theme(DarkSchemes.darkHighContrastScheme());
  }
}
