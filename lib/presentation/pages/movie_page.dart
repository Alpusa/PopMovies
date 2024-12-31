import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_routes.dart';
import '../../generated/l10n.dart';
import '../bloc/movie/movie_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/toggle_cubit.dart';
import '../widgets/movie_item.dart';
import '../widgets/toggle_item.dart';
import 'movie_detail_page.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener las traducciones y el tema actual
    var tr = S.of(context);
    var theme = Theme.of(context);

    return Scaffold(
      // Establecer el color de fondo de la pantalla
      backgroundColor: theme.colorScheme.surface,

      // Configurar el AppBar
      appBar: AppBar(
        title: Text(tr.app_name),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
        ),
        // Acción para cambiar el tema
        actions: [
          IconButton(
            icon: Icon(
              context.read<ThemeCubit>().state == ThemeData.light()
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {
              // Cambiar el tema entre claro y oscuro
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),

      // Cuerpo de la página
      body: Column(
        children: [
          // Sección de filtro de películas (favoritas vs populares)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider<ToggleCubit>(
              create: (context) => ToggleCubit(),
              child: ToggleItem(
                textOn: tr.popular_label,
                textOff: tr.favorite_label,
                initialValue: false,
                onChanged: (value) {
                  // Cuando el valor del interruptor cambie, mostramos las películas favoritas o populares
                  if (value) {
                    context.read<MovieBloc>().add(ShowFavoriteMoviesEvent());
                  } else {
                    context.read<MovieBloc>().add(GetMoviesEvent());
                  }
                },
              ),
            ),
          ),

          // Lista de películas
          Expanded(
            child: // BloC que construye la lista de películas
                BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                // Si está cargando, mostrar un indicador de carga
                if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Si las películas están cargadas, mostrar la lista de películas
                else if (state is MovieLoaded) {
                  if (state.movies.isEmpty) {
                    // Si no hay películas, mostrar un mensaje
                    return Center(child: Text(tr.no_movies));
                  } else {
                    // Si hay películas, mostrar una cuadrícula
                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: 16, // Espacio horizontal entre las películas
                        runSpacing:
                            16, // Espacio vertical entre las filas de películas
                        children: state.movies.map((movie) {
                          return SizedBox(
                            width:
                                300, // Ancho fijo para cada elemento MovieItem
                            child: MovieItem(
                              title: movie.title,
                              description: movie.overview,
                              imageUrl:
                                  "https://image.tmdb.org/t/p/original${movie.poster_path}",
                              // Al hacer tap en una película, navegar a la página de detalles
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.movieDetail,
                                  arguments: movie,
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                }

                // Si ocurre un error, mostrar el mensaje de error
                else if (state is MovieError) {
                  return Center(child: Text(state.message));
                } else {
                  // En cualquier otro caso, no mostrar nada
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
