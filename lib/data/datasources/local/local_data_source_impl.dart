// Importing Hive for local data storage.
import 'package:hive/hive.dart';

// Importing the MovieModel class to define the structure of stored data.
import '../../models/movie_model.dart';

// Importing the LocalDataSource interface to implement its contract.
import 'local_data_source.dart';

// Implementation of LocalDataSource for managing local storage of movie data.
class LocalDataSourceImpl implements LocalDataSource {
  // Hive box for storing cached movies.
  final Box<MovieModel> hiveBox;

  // Hive box for storing favorite movies.
  final Box<MovieModel> favoriteBox;

  // Constructor to initialize the Hive boxes for caching and favorites.
  LocalDataSourceImpl(this.hiveBox, this.favoriteBox);

  // Retrieves the list of cached movies from the hiveBox.
  @override
  Future<List<MovieModel>> getCachedMovies() async {
    return hiveBox.values.toList();
  }

  // Caches a list of movies by clearing old data and adding new entries.
  @override
  Future<void> cacheMovies(List<MovieModel> movies) async {
    await hiveBox.clear(); // Clears old cached data.
    for (var movie in movies) {
      await hiveBox.put(
          movie.id, movie); // Stores each movie using its ID as the key.
    }
  }

  // Adds a movie to the favorite movies list in the favoriteBox.
  @override
  Future<void> addFavoriteMovie(MovieModel movie) async {
    await favoriteBox.put(movie.id, movie);
  }

  // Removes a movie from the favorite movies list in the favoriteBox.
  @override
  Future<void> removeFavoriteMovie(MovieModel movie) async {
    await favoriteBox.delete(movie.id);
  }

  // Retrieves the list of favorite movies from the favoriteBox.
  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    return favoriteBox.values.toList();
  }

  // Checks if a movie is marked as a favorite in the favoriteBox.
  @override
  Future<bool> checkFavoriteMovie(MovieModel movie) async {
    return favoriteBox.containsKey(movie.id);
  }
}
