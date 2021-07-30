import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a1cce87ec8ce08701ddc62e5b4c92b7e';
  String _language = 'es-ES';
  String _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var client = http.Client();
    try {
      var uri = Uri.https(_baseUrl, '/3/movie/now_playing', {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      });

      var uriResponse = await client.get(uri);
      final nowPlayingResponse = NowPlayingResponse.fromJson(uriResponse.body);
      onDisplayMovies = nowPlayingResponse.results;
      notifyListeners(); // Notifica si hay cambios en la data
    } finally {
      client.close();
    }
  }
}
