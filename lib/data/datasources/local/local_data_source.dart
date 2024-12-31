// Importing the MovieModel class to define the structure of data handled by this interface.
import '../../models/movie_model.dart';

// Abstract class defining the contract for local data source operations.
abstract class LocalDataSource {
  // Retrieves a list of cached movies from local storage.
  Future<List<MovieModel>> getCachedMovies();

  // Caches a list of movies by storing them in local storage.
  Future<void> cacheMovies(List<MovieModel> movies);

  // Adds a movie to the list of favorite movies in local storage.
  Future<void> addFavoriteMovie(MovieModel movie);

  // Removes a movie from the list of favorite movies in local storage.
  Future<void> removeFavoriteMovie(MovieModel movie);

  // Retrieves a list of favorite movies from local storage.
  Future<List<MovieModel>> getFavoriteMovies();

  // Checks whether a movie is marked as a favorite in local storage.
  Future<bool> checkFavoriteMovie(MovieModel movie);
}
