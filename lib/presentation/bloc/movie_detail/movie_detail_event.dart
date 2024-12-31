part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

// Event to add a movie to favorites
final class AddToFavorites extends MovieDetailEvent {
  final Movie movie;

  AddToFavorites(this.movie);
}

// Event to remove a movie from favorites
final class RemoveFromFavorites extends MovieDetailEvent {
  final Movie movie;

  RemoveFromFavorites(this.movie);
}

// Event to check if a movie is in favorites
final class CheckIfFavorite extends MovieDetailEvent {
  final Movie movie;

  CheckIfFavorite(this.movie);
}
