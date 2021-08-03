import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a1cce87ec8ce08701ddc62e5b4c92b7e';
  String _language = 'es-ES';
  String _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCasts = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController =
      new StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      this._suggestionStreamController.stream;

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
    final popularResponse = PopularResponse.fromJson(body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners(); // Notifica si hay cambios en la data
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCasts.containsKey(movieId)) return moviesCasts[movieId]!;

    final String body =
        await this._getJsonData('/3/movie/$movieId/credits', _popularPage);

    final casting = CreditsResponse.fromJson(body);

    moviesCasts[movieId] = casting.cast;

    return casting.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    var client = http.Client();
    try {
      final uri = Uri.https(_baseUrl, '/3/search/movie', {
        'api_key': _apiKey,
        'language': _language,
        'query': query,
      });

      final uriResponse = await client.get(uri);
      final response = SearchResponse.fromJson(uriResponse.body);

      return response.results;
    } finally {
      client.close();
    }
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
