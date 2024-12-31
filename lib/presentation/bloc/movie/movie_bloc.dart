import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/add_favorite_movies.dart';
import '../../../domain/usecases/get_favorite_movies.dart';
import '../../../domain/usecases/get_popular_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  // Use cases for retrieving and managing movies.
  final GetPopularMovies getPopularMovies;
  final GetFavoriteMovies getFavoriteMovies;
  final AddFavoriteMovies addFavoriteMovie;

  // Constructor initializing the use cases and setting the initial state to MovieInitial.
  MovieBloc(
    this.getPopularMovies,
    this.getFavoriteMovies,
    this.addFavoriteMovie,
  ) : super(MovieInitial()) {
    // Event handler for the general MovieEvent.
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // Event handler for fetching popular movies.
    on<GetMoviesEvent>((event, emit) async {
      emit(MovieLoading()); // Emit a loading state
      try {
        // Fetch popular movies using the getPopularMovies use case.
        final movies = await getPopularMovies();
        // Emit the loaded movies state with the retrieved movies.
        emit(MovieLoaded(movies));
      } catch (e) {
        // If there's an error, emit an error state with the error message.
        emit(MovieError(e.toString()));
      }
    });

    // Event handler for fetching favorite movies.
    on<ShowFavoriteMoviesEvent>((event, emit) async {
      emit(MovieLoading()); // Emit a loading state
      try {
        // Fetch favorite movies using the getFavoriteMovies use case.
        final movies = await getFavoriteMovies();
        // Emit the loaded movies state with the retrieved movies.
        emit(MovieLoaded(movies));
      } catch (e) {
        // If there's an error, emit an error state with the error message.
        emit(MovieError(e.toString()));
      }
    });
  }
}
