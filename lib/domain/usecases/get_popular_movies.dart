import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

// This class represents the use case for retrieving the list of popular movies.
class GetPopularMovies {
  // The repository that handles the movie data (local, remote, etc.)
  final MovieRepository repository;

  // Constructor that takes a repository instance as a dependency.
  GetPopularMovies(this.repository);

  // This method calls the repository to fetch the list of popular movies.
  Future<List<Movie>> call() async {
    // Calls the getPopularMovies method in the repository and returns the result.
    return await repository.getPopularMovies();
  }
}
