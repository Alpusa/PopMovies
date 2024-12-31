# PopMovie

A Flutter application to explore popular movies by consuming data from The Movie Database (TMDb) API.

## Introduction

PopMovie is an application built using Flutter that allows users to view a list of popular movies, along with detailed information about each movie. The app fetches data from the TMDb API and displays it in a user-friendly interface. It allows users to view their favorite movies, and it handles offline scenarios by storing movie data locally.

## Features

- **Movie List**: Displays a list of popular movies with images, titles, and short descriptions.
- **Movie Details**: Tapping on a movie item opens a new screen with detailed information including a featured image, title, description, rating, release date, and popularity.
- **Offline Support**: Movie data is stored locally for offline viewing, in case of no internet connection.
- **Error Handling**: The app handles error scenarios such as 400 and 401 HTTP errors.
- **Clean Architecture**: The app follows the principles of Clean Architecture for better maintainability and scalability.
- **Bloc Pattern**: The application implements the Bloc pattern to manage state effectively.

## Getting Started

### Prerequisites

Make sure you have Flutter installed on your machine. If you don't have it yet, follow the instructions in the official Flutter documentation to get started.

- [Install Flutter](https://flutter.dev/docs/get-started/install)
- [Flutter Documentation](https://flutter.dev/docs)

### Installing

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Alpusa/PopMovies.git

2. Navigate to the project directory:

   ```bash
   cd PopMovies

3. Install the necessary dependencies:

   ```bash
   flutter pub get

4. To run the app, use the following command:

   ```bash
   flutter run

## Example Usage

Upon launching the app, you will see the list of popular movies. You can tap on any movie to see its detailed information.

## Viewing Movie Details

Tap on a movie from the list to view its detailed page, which includes a featured image, title, description, rating, release date, and popularity.

## Offline Support

In case of no internet access, the app will show the previously saved movie data.

## Screenshots

Below are some screenshots of how the app looks and functions:

### Home Screen - Popular Movies

<img src="https://github.com/Alpusa/PopMovies/blob/main/images/popularMovies.jpeg" width="300">

### Detail Movie

<img src="https://github.com/Alpusa/PopMovies/blob/main/images/detailMovie.jpeg" width="300">

## File Structure

The project is structured as follows:

```plaintext
lib/
├── core/
│   ├── constants/
│   │   └── app_routes.dart
│   ├── utils/
│   │   └── validators.dart
|   |   ├── network_info/
│   │   |   └── network_info.dart
│   │   |   └── network_info_impl.dart
│   ├── themes/
│   │   └── dark_schemes.dart
│   │   └── light_schemes.dart
│   │   └── material_theme.dart
│   │   └── theme_utils.dart
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   │   └── local_data_source.dart
│   │   │   └── local_data_source_impl.dart
│   │   ├── remote/
│   │   │   └── remote_data_source.dart
│   │   │   └── remote_data_source_impl.dart
│   ├── models/
│   │   └── movie_model.dart
│   │   └── movie_model.g.dart
│   ├── repositories/
│   │   └── movie_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── movie.dart
│   ├── repositories/
│   │   └── _movierepository.dart
│   ├── usecases/
│   │   └── get_popular_movies.dart
│   │   └── get_favorite_movies.dart
│   │   └── check_favorite_movies.dart
│   │   └── add_favorite_movies.dart
│   │   └── remove_favorite_movies.dart
├── generated/
│   ├── intl
│   │   └── messages_all.dart
│   │   └── messages_en.dart
│   │   └── messages_es.dart
│   └── l10n.dart
├── l10n/
│   └── intl_en.arb
│   └── intl_es.arb
├── presentation/
│   ├── bloc/
│   │   ├── load_image/
│   │   │   └── load_image_bloc.dart
│   │   │   └── load_image_event.dart
│   │   │   └── load_image_state.dart
│   │   ├── movie/
│   │   │   └── movie_bloc.dart
│   │   │   └── movie_event.dart
│   │   │   └── movie_state.dart
│   │   ├── movie_detail/
│   │   │   └── movie_detail_bloc.dart
│   │   │   └── movie_detail_event.dart
│   │   │   └── movie_detail_state.dart
│   ├── cubit/
│   │   └── theme_cubit.dart
│   │   └── toggle_cubit.dart
│   ├── pages/
│   │   └── movie_detail_page.dart
│   │   └── movie_page.dart
│   ├── widgets/
│   │   └── cached_image_item.dart
│   │   └── movie_item.dart
│   │   └── toggle_item.dart
├── injection_container.dart
├── main.dart
```

## Contributing

Feel free to fork this repository and submit pull requests. If you encounter any issues or have suggestions, please open an issue in the [Issues section](https://github.com/Alpusa/PopMovies/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
