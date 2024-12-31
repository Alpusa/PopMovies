import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

// This class represents the use case for removing a movie from the favorite list.
class RemoveFavoriteMovies {
  // The repository that handles the movie data (local, remote, etc.)
  final MovieRepository repository;

  // Constructor that takes a repository instance as a dependency.
  RemoveFavoriteMovies(this.repository);

  // This method calls the repository to remove the specified movie from the favorites.
  Future<void> call(Movie movie) async {
    // Calls the removeFavoriteMovie method in the repository to remove the movie.
    return await repository.removeFavoriteMovie(movie);
  }
}
