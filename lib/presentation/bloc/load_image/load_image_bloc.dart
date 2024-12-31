import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'load_image_event.dart';
part 'load_image_state.dart';

// Bloc that handles loading and caching images.
class LoadImageBloc extends Bloc<LoadImageEvent, LoadImageState> {
  // Instance of the DefaultCacheManager to handle image caching.
  final DefaultCacheManager cacheManager;

  // Constructor that initializes the cacheManager and sets the initial state.
  LoadImageBloc(this.cacheManager) : super(ImageInitial()) {
    // Event handler for LoadImageEvent
    on<LoadImageEvent>((event, emit) {
      // TODO: implement event handler if necessary
    });

    // Event handler for loading an image.
    on<LoadImage>((event, emit) async {
      // Emit loading state while fetching the image.
      emit(ImageLoading());

      try {
        // Try to get the image file from the cache.
        var fileInfo = await cacheManager.getFileFromCache(event.url);
        if (fileInfo != null) {
          // If the image is cached, read its bytes and emit the loaded state.
          final bytes = await fileInfo.file.readAsBytes();
          emit(ImageLoaded(imageBytes: bytes, file: fileInfo.file));
        } else {
          // If the image is not cached, fetch it from the network and emit the loaded state.
          var file = await cacheManager.getSingleFile(event.url);
          final bytes = await file.readAsBytes();
          emit(ImageLoaded(imageBytes: bytes, file: file));
        }
      } catch (e) {
        // If an error occurs while loading the image, emit the error state.
        emit(ImageError("${Intl.message("error_loading_image")}: $e"));
      }
    });
  }
}
