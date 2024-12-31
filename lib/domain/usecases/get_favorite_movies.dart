import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

// This class represents the use case for retrieving the list of favorite movies.
class GetFavoriteMovies {
  // The repository that handles the movie data (local, remote, etc.)
  final MovieRepository repository;

  // Constructor that takes a repository instance as a dependency.
  GetFavoriteMovies(this.repository);

  // This method calls the repository to fetch the list of favorite movies.
  Future<List<Movie>> call() async {
    // Calls the getFavoriteMovies method in the repository and returns the result
    return await repository.getFavoriteMovies();
  }
}
