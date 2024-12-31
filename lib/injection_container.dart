// This file sets up dependency injection for the application.

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

import 'core/utils/network_info/network_info.dart';
import 'core/utils/network_info/network_info_impl.dart';
import 'data/datasources/local/local_data_source.dart';
import 'data/datasources/local/local_data_source_impl.dart';
import 'data/datasources/remote/remote_data_source.dart';
import 'data/datasources/remote/remote_data_source_impl.dart';
import 'data/models/movie_model.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/add_favorite_movies.dart';
import 'domain/usecases/check_favorite_movies.dart';
import 'domain/usecases/get_favorite_movies.dart';
import 'domain/usecases/get_popular_movies.dart';
import 'domain/usecases/remove_favorite_movies.dart';
import 'presentation/bloc/movie/movie_bloc.dart';
import 'presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'presentation/cubit/theme_cubit.dart';
import 'presentation/cubit/toggle_cubit.dart';

final sl = GetIt.instance; // Service locator instance.

Future<void> init() async {
  // Data sources initialization
  await Hive.initFlutter(); // Initialize Hive for local storage
  Hive.registerAdapter(
      MovieModelAdapter()); // Register MovieModel adapter for Hive
  Box<MovieModel> boxPopMovies = await Hive.openBox<MovieModel>('popMovies');
  Box<MovieModel> boxPopFavMovies =
      await Hive.openBox<MovieModel>('popFavMovies');

  // Cache manager setup
  final DefaultCacheManager _cacheManager = DefaultCacheManager();
  sl.registerLazySingleton<DefaultCacheManager>(() => _cacheManager);

  // HTTP client initialization
  final client = http.Client();
  sl.registerLazySingleton<http.Client>(() => client);

  // Local data source registration
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(boxPopMovies, boxPopFavMovies));

  // Remote data source registration
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));

  // Network info registration
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Bloc setup for movie-related features
  sl.registerFactory(() => MovieBloc(
        sl(), // GetPopularMovies use case
        sl(), // GetFavoriteMovies use case
        sl(), // AddFavoriteMovies use case
      ));
  sl.registerFactory(() => MovieDetailBloc(
        sl(), // GetMovieDetails use case
        sl(), // CheckFavoriteMovies use case
        sl(), // RemoveFavoriteMovies use case
      ));

  // Theme and Toggle Cubits setup
  sl.registerFactory(() => ThemeCubit());
  sl.registerFactory(() => ToggleCubit());

  // Repository registration
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // Use cases registration for movie management
  sl.registerLazySingleton(() => GetPopularMovies(sl()));
  sl.registerLazySingleton(() => GetFavoriteMovies(sl()));
  sl.registerLazySingleton(() => AddFavoriteMovies(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteMovies(sl()));
  sl.registerLazySingleton(() => CheckFavoriteMovies(sl()));
}
