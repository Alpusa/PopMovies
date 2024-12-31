part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

// State when the movie data is not yet loaded (initial state).
final class MovieInitial extends MovieState {}

// State when the movie data is being loaded (for example, showing a loading indicator).
final class MovieLoading extends MovieState {}

// State when the movie data has been successfully loaded.
final class MovieLoaded extends MovieState {
  final List<Movie> movies; // List of movies that were successfully fetched

  MovieLoaded(this.movies);
}

// State when there is an error fetching movie data.
final class MovieError extends MovieState {
  final String message; // Error message

  MovieError(this.message);
}
