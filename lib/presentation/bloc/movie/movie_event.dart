part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

// Event to fetch popular movies.
final class GetMoviesEvent extends MovieEvent {}

// Event to show favorite movies.
final class ShowFavoriteMoviesEvent extends MovieEvent {}

// Event to go to the next page (used for pagination).
final class NextPageEvent extends MovieEvent {}

// Event to go to the previous page (used for pagination).
final class PreviousPageEvent extends MovieEvent {}
