// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `PopMovies`
  String get app_name {
    return Intl.message(
      'PopMovies',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular_label {
    return Intl.message(
      'Popular',
      name: 'popular_label',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite_label {
    return Intl.message(
      'Favorite',
      name: 'favorite_label',
      desc: '',
      args: [],
    );
  }

  /// `No movies`
  String get no_movies {
    return Intl.message(
      'No movies',
      name: 'no_movies',
      desc: '',
      args: [],
    );
  }

  /// `Release date`
  String get release_date {
    return Intl.message(
      'Release date',
      name: 'release_date',
      desc: '',
      args: [],
    );
  }

  /// `Vote average`
  String get vote_average {
    return Intl.message(
      'Vote average',
      name: 'vote_average',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorites`
  String get add_to_favorites {
    return Intl.message(
      'Add to favorites',
      name: 'add_to_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Remove from favorites`
  String get remove_from_favorites {
    return Intl.message(
      'Remove from favorites',
      name: 'remove_from_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Error loading image`
  String get error_loading_image {
    return Intl.message(
      'Error loading image',
      name: 'error_loading_image',
      desc: '',
      args: [],
    );
  }

  /// `No image loaded`
  String get no_image_loaded {
    return Intl.message(
      'No image loaded',
      name: 'no_image_loaded',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
