import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_routes.dart';
import '../../domain/entities/movie.dart';
import '../../generated/l10n.dart';
import '../bloc/movie_detail/movie_detail_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../widgets/cached_image_item.dart';

class MovieDetailPage extends StatelessWidget {
  // The route name for navigation
  static const String routeName = AppRoutes.movieDetail;
  final Movie movie;

  // Constructor to accept the movie object
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context); // Get translations for the current context
    var theme = Theme.of(context); // Get the current theme

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              context.read<ThemeCubit>().state ==
                      ThemeData.light() // Check the current theme
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {
              context
                  .read<ThemeCubit>()
                  .toggleTheme(); // Toggle theme between light and dark
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Featured image of the movie
              CachedImageItem(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original${movie.poster_path}'),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 600), // Set maximum width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie title
                      Text(
                        movie.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      // Movie description
                      Text(
                        movie.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      // Movie details (release date, rating, popularity)
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 18, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            '${tr.release_date}: ${movie.release_date.day}/${movie.release_date.month}/${movie.release_date.year}',
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              size: 18, color: Colors.yellow),
                          const SizedBox(width: 8),
                          Text(
                            '${tr.rating}: ${movie.vote_average}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.trending_up,
                              size: 18, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(
                            '${tr.popular_label}: ${movie.popularity}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Favorite button
                      Center(
                        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
                          builder: (context, state) {
                            return ElevatedButton.icon(
                              onPressed: () {
                                if (state is MovieDetailFavoriteCheck) {
                                  if (state.isFavorite) {
                                    context.read<MovieDetailBloc>().add(
                                          RemoveFromFavorites(
                                              movie), // Remove from favorites
                                        );
                                  } else {
                                    context.read<MovieDetailBloc>().add(
                                          AddToFavorites(
                                              movie), // Add to favorites
                                        );
                                  }
                                }
                              },
                              icon: Icon(
                                state is MovieDetailFavoriteCheck &&
                                        state.isFavorite
                                    ? Icons
                                        .favorite // Display filled heart if favorited
                                    : Icons
                                        .favorite_border, // Display empty heart if not favorited
                              ),
                              label: Text(state is MovieDetailFavoriteCheck &&
                                      state.isFavorite
                                  ? tr.remove_from_favorites // Text for removing from favorites
                                  : tr.add_to_favorites), // Text for adding to favorites
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
