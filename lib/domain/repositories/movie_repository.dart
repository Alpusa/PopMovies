import '../entities/movie.dart';

// Abstract repository interface for managing movie data.
abstract class MovieRepository {
  // Fetches a list of popular movies from the data source.
  Future<List<Movie>> getPopularMovies();

  // Retrieves a list of favorite movies from the data source.
  Future<List<Movie>> getFavoriteMovies();

  // Adds a movie to the list of favorites in the data source.
  Future<void> addFavoriteMovie(Movie movie);

  // Removes a movie from the list of favorites in the data source.
  Future<void> removeFavoriteMovie(Movie movie);

  // Checks if a given movie is in the list of favorites in the data source.
  Future<bool> checkFavoriteMovie(Movie movie);
}
