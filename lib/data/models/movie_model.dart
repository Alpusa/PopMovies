// Importing necessary libraries and files.
import 'package:hive/hive.dart'; // For local data storage.
import 'package:json_annotation/json_annotation.dart'; // For JSON serialization.

import '../../domain/entities/movie.dart'; // Base class for movie data.

part 'movie_model.g.dart'; // Generated file for JSON serialization and deserialization.

// A Hive type and JSON-serializable class that extends the Movie entity.
@HiveType(typeId: 0) // Assigning a type ID for Hive storage.
@JsonSerializable() // Annotation to generate JSON serialization methods.
class MovieModel extends Movie {
  @override
  @HiveField(0) // Field ID for Hive storage.
  bool adult;

  @override
  @HiveField(1)
  String backdrop_path;

  @override
  @HiveField(2)
  List<int> genre_ids;

  @override
  @HiveField(3)
  int id;

  @override
  @HiveField(4)
  String original_language;

  @override
  @HiveField(5)
  String original_title;

  @override
  @HiveField(6)
  String overview;

  @override
  @HiveField(7)
  double popularity;

  @override
  @HiveField(8)
  String poster_path;

  @override
  @HiveField(9)
  DateTime release_date;

  @override
  @HiveField(10)
  String title;

  @override
  @HiveField(11)
  bool video;

  @override
  @HiveField(12)
  double vote_average;

  @override
  @HiveField(13)
  int vote_count;

  // Constructor initializing all properties and passing them to the superclass.
  MovieModel({
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
  }) : super(
          adult: adult,
          backdrop_path: backdrop_path,
          genre_ids: genre_ids,
          id: id,
          original_language: original_language,
          original_title: original_title,
          overview: overview,
          popularity: popularity,
          poster_path: poster_path,
          release_date: release_date,
          title: title,
          video: video,
          vote_average: vote_average,
          vote_count: vote_count,
        );

  // Factory method to create a MovieModel instance from a JSON map.
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  // Method to convert a MovieModel instance into a JSON map.
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
