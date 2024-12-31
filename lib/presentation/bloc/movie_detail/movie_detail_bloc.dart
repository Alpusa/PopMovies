import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/add_favorite_movies.dart';
import '../../../domain/usecases/check_favorite_movies.dart';
import '../../../domain/usecases/remove_favorite_movies.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final AddFavoriteMovies
      addFavoriteMovie; // Use case for adding a movie to favorites
  final RemoveFavoriteMovies
      removeFavoriteMovie; // Use case for removing a movie from favorites
  final CheckFavoriteMovies
      checkFavoriteMovie; // Use case for checking if a movie is a favorite

  MovieDetailBloc(
    this.addFavoriteMovie,
    this.removeFavoriteMovie,
    this.checkFavoriteMovie,
  ) : super(MovieDetailInitial()) {
    // Event handler for all movie detail events
    on<MovieDetailEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Event handler for adding a movie to favorites
    on<AddToFavorites>((event, emit) async {
      emit(MovieDetailLoading()); // Emit loading state
      await addFavoriteMovie(event.movie).then((val) {
        emit(MovieDetailFavoriteCheck(
            true)); // Emit state when the movie is added to favorites
      });
    });

    // Event handler for removing a movie from favorites
    on<RemoveFromFavorites>((event, emit) async {
      emit(MovieDetailLoading()); // Emit loading state
      await removeFavoriteMovie(event.movie).then((val) {
        emit(MovieDetailFavoriteCheck(
            false)); // Emit state when the movie is removed from favorites
      });
    });

    // Event handler for checking if a movie is in the favorites
    on<CheckIfFavorite>((event, emit) async {
      emit(MovieDetailLoading()); // Emit loading state
      await checkFavoriteMovie(event.movie).then((val) {
        emit(MovieDetailFavoriteCheck(
            val)); // Emit the result of the check (true or false)
      });
    });
  }
}
