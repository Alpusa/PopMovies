// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      adult: fields[0] as bool,
      backdrop_path: fields[1] as String,
      genre_ids: (fields[2] as List).cast<int>(),
      id: fields[3] as int,
      original_language: fields[4] as String,
      original_title: fields[5] as String,
      overview: fields[6] as String,
      popularity: fields[7] as double,
      poster_path: fields[8] as String,
      release_date: fields[9] as DateTime,
      title: fields[10] as String,
      video: fields[11] as bool,
      vote_average: fields[12] as double,
      vote_count: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdrop_path)
      ..writeByte(2)
      ..write(obj.genre_ids)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.original_language)
      ..writeByte(5)
      ..write(obj.original_title)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.poster_path)
      ..writeByte(9)
      ..write(obj.release_date)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.vote_average)
      ..writeByte(13)
      ..write(obj.vote_count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      adult: json['adult'] as bool,
      backdrop_path: json['backdrop_path'] as String,
      genre_ids: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      original_language: json['original_language'] as String,
      original_title: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      poster_path: json['poster_path'] as String,
      release_date: DateTime.parse(json['release_date'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      vote_average: (json['vote_average'] as num).toDouble(),
      vote_count: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'genre_ids': instance.genre_ids,
      'id': instance.id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
