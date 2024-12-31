part of 'load_image_bloc.dart';

// Abstract class for defining all image loading states.
@immutable
sealed class LoadImageState {}

// State when the image loading process has not started yet.
final class ImageInitial extends LoadImageState {}

// State indicating that the image is being loaded.
final class ImageLoading extends LoadImageState {}

// State when the image has been successfully loaded.
final class ImageLoaded extends LoadImageState {
  final Uint8List imageBytes; // For Web (image data in bytes)
  final File file; // For mobile and desktop (file object)

  // Constructor requiring both image bytes and the file to be provided.
  ImageLoaded({required this.imageBytes, required this.file});

  // Overriding the 'props' method to compare the state objects effectively.
  @override
  List<Object> get props => [imageBytes, file];
}

// State when there is an error during image loading.
final class ImageError extends LoadImageState {
  final String errorMessage;

  // Constructor that takes an error message to provide feedback.
  ImageError(this.errorMessage);

  // Overriding the 'props' method to compare the state objects effectively.
  @override
  List<Object> get props => [errorMessage];
}
