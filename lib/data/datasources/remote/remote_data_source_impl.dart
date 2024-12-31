// Importing necessary Dart and third-party libraries.
import 'dart:convert'; // For JSON encoding and decoding.
import 'package:http/http.dart'; // For making HTTP requests.
import 'package:intl/intl.dart'; // For locale management.

import '../../models/movie_model.dart'; // Importing the MovieModel for data representation.
import 'remote_data_source.dart'; // Importing the abstract class to implement its contract.

// Implementation of RemoteDataSource for fetching movie data from a remote API.
class RemoteDataSourceImpl implements RemoteDataSource {
  // HTTP client for making API calls.
  final Client apiClient;

  // API key for authenticating requests to the movie database.
  final String apiKey = "7890960fbb0e6f841d8249247b31f5e6";

  // Constructor to initialize the HTTP client.
  RemoteDataSourceImpl(this.apiClient);

  // Fetches a list of popular movies from the remote API.
  @override
  Future<List<MovieModel>> fetchMovies() async {
    late final Response response;
    // Get the current locale of the application to fetch localized movie data.
    String currentLocale = Intl.getCurrentLocale();

    try {
      // Make a GET request to the API with the API key and locale.
      response = await apiClient.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=$currentLocale'));
    } catch (e) {
      // Re-throw the exception for external handling.
      throw Exception('Failed to load movies');
    }

    // Check the response status code to determine the result of the API call.
    if (response.statusCode == 200) {
      // Parse the response body as a JSON string.
      final jsonString = response.body;
      // Convert the JSON string to a map.
      final jsonMap = json.decode(jsonString);
      // Extract the list of movies from the JSON map.
      final List<dynamic> results = jsonMap['results'];
      // Map the list of JSON objects to a list of MovieModel instances.
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    } else if (response.statusCode == 400) {
      // Handle bad request errors.
      throw Exception('Bad request');
    } else if (response.statusCode == 401) {
      // Handle unauthorized errors.
      throw Exception('Unauthorized');
    } else {
      // Handle all other errors.
      throw Exception('Failed to load movies');
    }
  }
}
