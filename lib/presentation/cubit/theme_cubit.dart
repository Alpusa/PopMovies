import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The ThemeCubit class is used to manage the app's theme (light/dark mode)
class ThemeCubit extends Cubit<ThemeData> {
  // Initial state is set to light theme
  ThemeCubit() : super(ThemeData.light());

  // This method toggles between light and dark theme
  void toggleTheme() {
    // If the current state is light theme, switch to dark theme
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
    } else {
      // Otherwise, switch to light theme
      emit(ThemeData.light());
    }
  }
}
