// Entity class representing a movie.
class Movie {
  // Indicates if the movie is for adults only.
  bool adult;

  // Path to the backdrop image of the movie.
  String backdrop_path;

  // List of genre IDs associated with the movie.
  List<int> genre_ids;

  // Unique identifier of the movie.
  int id;

  // The original language of the movie.
  String original_language;

  // The original title of the movie.
  String original_title;

  // A brief summary or description of the movie.
  String overview;

  // The popularity score of the movie.
  double popularity;

  // Path to the poster image of the movie.
  String poster_path;

  // The release date of the movie.
  DateTime release_date;

  // The title of the movie.
  String title;

  // Indicates if the movie is a video.
  bool video;

  // The average vote rating of the movie.
  double vote_average;

  // The total number of votes received by the movie.
  int vote_count;

  // Constructor to initialize the movie properties.
  Movie({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });
}
