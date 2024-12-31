import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

// This class represents the use case for checking if a movie is in the favorites.
class CheckFavoriteMovies {
  // The repository that handles the movie data (local, remote, etc.)
  final MovieRepository repository;

  // Constructor that takes a repository instance as a dependency.
  CheckFavoriteMovies(this.repository);

  // This method calls the repository to check if a movie is in the favorites.
  // It returns a boolean value indicating whether the movie is a favorite or not.
  Future<bool> call(Movie movie) async {
    // Calls the checkFavoriteMovie method in the repository
    return await repository.checkFavoriteMovie(movie);
  }
}
