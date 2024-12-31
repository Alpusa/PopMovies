part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

// Initial state when the MovieDetailBloc is first created
final class MovieDetailInitial extends MovieDetailState {}

// Loading state when an operation is in progress (e.g., adding/removing movie from favorites)
final class MovieDetailLoading extends MovieDetailState {}

// State to check if the movie is marked as a favorite
final class MovieDetailFavoriteCheck extends MovieDetailState {
  final bool isFavorite;

  MovieDetailFavoriteCheck(this.isFavorite);
}
