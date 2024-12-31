// Importing necessary dependencies.
import '../../core/utils/network_info/network_info.dart'; // For checking network connectivity.
import '../datasources/local/local_data_source.dart'; // Local data source interface.
import '../datasources/remote/remote_data_source.dart'; // Remote data source interface.
import '../models/movie_model.dart'; // Movie model implementation.
import '../../domain/entities/movie.dart'; // Movie entity definition.
import '../../domain/repositories/movie_repository.dart'; // Movie repository interface.

// Implementation of the MovieRepository interface.
class MovieRepositoryImpl implements MovieRepository {
  final LocalDataSource
      localDataSource; // Local data source for caching and favorite movies.
  final RemoteDataSource
      remoteDataSource; // Remote data source for fetching data from API.
  final NetworkInfo networkInfo; // Network connectivity utility.

  // Constructor for dependency injection.
  MovieRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Movie>> getPopularMovies() async {
    bool isConnected =
        await networkInfo.isConnected; // Check network connection.
    if (isConnected) {
      try {
        final movies = await remoteDataSource
            .fetchMovies(); // Fetch movies from remote source.
        movies.sort(
            (a, b) => a.title.compareTo(b.title)); // Sort movies by title.
        await localDataSource
            .cacheMovies(movies); // Cache the fetched movies locally.
        return movies;
      } catch (e) {
        // Handle error by returning cached movies if available.
        final movies = await localDataSource.getCachedMovies();
        movies.sort(
            (a, b) => a.title.compareTo(b.title)); // Sort movies by title.
        return movies;
      }
    } else {
      try {
        final movies = await localDataSource
            .getCachedMovies(); // Get cached movies when offline.
        movies.sort(
            (a, b) => a.title.compareTo(b.title)); // Sort movies by title.
        return movies;
      } catch (e) {
        throw Exception(
            'Failed to fetch cached movies: $e'); // Throw exception if no cache exists.
      }
    }
  }

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    try {
      final movies = await localDataSource
          .getFavoriteMovies(); // Get favorite movies from local data source.
      movies
          .sort((a, b) => a.title.compareTo(b.title)); // Sort movies by title.
      return movies;
    } catch (e) {
      throw Exception(
          'Failed to fetch favorite movies: $e'); // Throw exception on failure.
    }
  }

  @override
  Future<void> addFavoriteMovie(Movie movie) async {
    try {
      // Convert Movie entity to MovieModel for storage.
      MovieModel movieModel = MovieModel(
        adult: movie.adult,
        backdrop_path: movie.backdrop_path,
        genre_ids: movie.genre_ids,
        id: movie.id,
        original_language: movie.original_language,
        original_title: movie.original_title,
        overview: movie.overview,
        popularity: movie.popularity,
        poster_path: movie.poster_path,
        release_date: movie.release_date,
        title: movie.title,
        video: movie.video,
        vote_average: movie.vote_average,
        vote_count: movie.vote_count,
      );
      await localDataSource.addFavoriteMovie(
          movieModel); // Add favorite movie to local data source.
    } catch (e) {
      throw Exception(
          'Failed to add favorite movie: $e'); // Throw exception on failure.
    }
  }

  @override
  Future<void> removeFavoriteMovie(Movie movie) async {
    try {
      // Convert Movie entity to MovieModel for removal.
      MovieModel movieModel = MovieModel(
        adult: movie.adult,
        backdrop_path: movie.backdrop_path,
        genre_ids: movie.genre_ids,
        id: movie.id,
        original_language: movie.original_language,
        original_title: movie.original_title,
        overview: movie.overview,
        popularity: movie.popularity,
        poster_path: movie.poster_path,
        release_date: movie.release_date,
        title: movie.title,
        video: movie.video,
        vote_average: movie.vote_average,
        vote_count: movie.vote_count,
      );
      await localDataSource.removeFavoriteMovie(
          movieModel); // Remove favorite movie from local data source.
    } catch (e) {
      throw Exception(
          'Failed to remove favorite movie: $e'); // Throw exception on failure.
    }
  }

  @override
  Future<bool> checkFavoriteMovie(Movie movie) async {
    try {
      // Convert Movie entity to MovieModel for checking.
      MovieModel movieModel = MovieModel(
        adult: movie.adult,
        backdrop_path: movie.backdrop_path,
        genre_ids: movie.genre_ids,
        id: movie.id,
        original_language: movie.original_language,
        original_title: movie.original_title,
        overview: movie.overview,
        popularity: movie.popularity,
        poster_path: movie.poster_path,
        release_date: movie.release_date,
        title: movie.title,
        video: movie.video,
        vote_average: movie.vote_average,
        vote_count: movie.vote_count,
      );
      return await localDataSource
          .checkFavoriteMovie(movieModel); // Check if movie is a favorite.
    } catch (e) {
      throw Exception(
          'Failed to check favorite movie: $e'); // Throw exception on failure.
    }
  }
}
