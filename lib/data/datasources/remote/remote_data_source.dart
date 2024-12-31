// Importing the MovieModel class to define the structure of data handled by this interface.
import '../../models/movie_model.dart';

// Abstract class defining the contract for a remote data source.
abstract class RemoteDataSource {
  // Fetches a list of movies from a remote API.
  // Returns a Future that resolves to a list of MovieModel objects.
  Future<List<MovieModel>> fetchMovies();
}
