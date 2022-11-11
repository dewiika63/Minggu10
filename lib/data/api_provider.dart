import 'dart:convert';
import "package:http/http.dart" show Client, Response;
import 'package:movie_db/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '08fbd4b5e54160c6e2aa3613b2b62bfb';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Uri url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    Response response = await client.get(url);

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
