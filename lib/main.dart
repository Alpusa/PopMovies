// This is the entry point of the Flutter application.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_routes.dart';
import 'generated/l10n.dart';
import 'injection_container.dart' as di;
import './core/themes/material_theme.dart';
import 'presentation/cubit/theme_cubit.dart';

Future<void> main() async {
  // Ensure all bindings are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection.
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialTheme materialTheme = MaterialTheme(); // Theme setup
    return BlocProvider<ThemeCubit>(
      // Providing the ThemeCubit to the widget tree
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        // Listening to theme changes
        builder: (context, state) {
          return MaterialApp(
            title: 'Pop Movies', // Application title
            debugShowCheckedModeBanner: false, // Disable the debug banner
            supportedLocales: S.delegate
                .supportedLocales, // Supported locales for localization
            localizationsDelegates: const [
              S.delegate, // Localization delegate for app translations
              GlobalMaterialLocalizations
                  .delegate, // Localization for Material widgets
              GlobalWidgetsLocalizations
                  .delegate, // Localization for general widgets
              GlobalCupertinoLocalizations
                  .delegate, // Localization for Cupertino widgets (iOS style)
            ],
            theme: state, // Using light theme based on the current state
            darkTheme:
                materialTheme.dark(), // Using dark theme from the custom theme
            themeMode: ThemeMode.light, // Set the default theme mode to light
            initialRoute: AppRoutes.home, // Set the initial route of the app
            onGenerateRoute:
                AppRoutes.generateRoute, // Route generation handler
          );
        },
      ),
    );
  }
}
