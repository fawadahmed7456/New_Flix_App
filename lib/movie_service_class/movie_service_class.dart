import 'dart:convert';
import 'package:new_flix_2/models/movie_model_class.dart';
import 'package:http/http.dart' as http;

class MovieService {
  // This method fetches a list of movies from the provided API path.
  static Future<List<Movie>> getMovies(String path) async {
    try {
      // Make an HTTP GET request to the provided API path.
      final response = await http.get(Uri.parse(path));

      // Check if the response status code is 200 (OK).
      if (response.statusCode == 200) {
        // Decode the JSON data from the response body and extract the 'results' field.
        final decodedData = json.decode(response.body)['results'] as List;

        // Map the decoded data to a list of Movie objects using the Movie.fromJson constructor.
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception("Error in generating response: ${response.statusCode}");
      }
    } catch (e) {
      // Catch any exceptions that occur during the HTTP request or decoding process.
      throw Exception("Error: $e");
    }
  }
}
