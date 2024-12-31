import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection_container.dart' as di;

import '../../generated/l10n.dart';
import '../bloc/load_image/load_image_bloc.dart';

class CachedImageItem extends StatelessWidget {
  final String imageUrl;

  CachedImageItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Obtener las traducciones
    var tr = S.of(context);

    return BlocProvider(
      // Crear el BLoC para cargar la imagen
      create: (context) => LoadImageBloc(di.sl())..add(LoadImage(imageUrl)),
      child: BlocBuilder<LoadImageBloc, LoadImageState>(
        builder: (context, state) {
          // Si la imagen está cargando, mostrar un indicador de carga
          if (state is ImageLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Si la imagen se cargó correctamente, mostrarla
          else if (state is ImageLoaded) {
            if (kIsWeb) {
              // Si estamos en la web, usar Image.memory para cargar la imagen desde bytes en memoria
              return Image.memory(
                state.imageBytes,
                fit: BoxFit.contain,
                height: 400,
              );
            } else if (Platform.isAndroid ||
                Platform.isIOS ||
                Platform.isFuchsia) {
              // Si estamos en dispositivos móviles, usar Image.file para cargar la imagen desde un archivo
              return Image.file(
                state.file,
                fit: BoxFit.contain,
                height: 400,
              );
            } else {
              // Si estamos en escritorio (Windows, macOS, Linux), también usar Image.file
              return Image.file(
                state.file,
                fit: BoxFit.contain,
                height: 400,
              );
            }
          }

          // Si hubo un error al cargar la imagen, mostrar un mensaje de error
          else if (state is ImageError) {
            return Center(child: Text(state.errorMessage));
          }

          // Si no hay estado de imagen, mostrar un mensaje de que no se cargó la imagen
          else {
            return Center(child: Text(tr.no_image_loaded));
          }
        },
      ),
    );
  }
}
