import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a1cce87ec8ce08701ddc62e5b4c92b7e';
  String _language = 'es-ES';
  String _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var client = http.Client();
    try {
      var uri = Uri.https(_baseUrl, endPoint, {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page',
      });

      var uriResponse = await client.get(uri);
      return uriResponse.body;
    } finally {
      client.close();
    }
  }

  getOnDisplayMovies() async {
    String body = await this._getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); // Notifica si hay cambios en la data
  }

  getPopularMovies() async {
    _popularPage++;
    final String body =
        await this._getJsonData('/3/movie/popular', _popularPage);
    print(_popularPage);
    final popularResponse = PopularResponse.fromJson(body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners(); // Notifica si hay cambios en la data
  }
}
