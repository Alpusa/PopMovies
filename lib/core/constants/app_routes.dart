// This file contains all the routes of the application.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../../presentation/bloc/movie/movie_bloc.dart';
import '../../presentation/bloc/movie_detail/movie_detail_bloc.dart';
import '../../presentation/pages/movie_detail_page.dart';
import '../../presentation/pages/movie_page.dart';
import '../../injection_container.dart' as di;

class AppRoutes {
  // Define the home route
  static const String home = '/';

  // Define the movie detail route
  static const String movieDetail = '/movie-detail';

  /// Generates a route based on the [RouteSettings].
  /// Handles navigation to different screens of the app.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        // Route for the home page displaying the list of movies
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => di.sl<MovieBloc>()..add(GetMoviesEvent()),
            child: MoviePage(),
          ),
        );
      case movieDetail:
        // Route for the movie detail page, expects a Movie object as argument
        final args = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => di.sl<MovieDetailBloc>()..add(CheckIfFavorite(args)),
            child: MovieDetailPage(movie: args),
          ),
        );
      default:
        // Default route to fallback to the home page
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => di.sl<MovieBloc>()..add(GetMoviesEvent()),
            child: MoviePage(),
          ),
        );
    }
  }
}
