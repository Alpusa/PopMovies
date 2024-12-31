import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

// This class represents the use case for adding a movie to the favorites.
class AddFavoriteMovies {
  // The repository that handles the movie data (local, remote, etc.)
  final MovieRepository repository;

  // Constructor that takes a repository instance as a dependency.
  AddFavoriteMovies(this.repository);

  // This method calls the repository to add a movie to the favorites.
  // The movie object is passed as a parameter.
  Future<void> call(Movie movie) async {
    // Calls the addFavoriteMovie method in the repository
    return await repository.addFavoriteMovie(movie);
  }
}
