part of 'load_image_bloc.dart';

// Abstract class for defining all image loading events.
@immutable
sealed class LoadImageEvent {}

// Event triggered to load an image from a URL.
final class LoadImage extends LoadImageEvent {
  // URL of the image to be loaded.
  final String url;

  // Constructor that takes the URL of the image to be loaded.
  LoadImage(this.url);
}
