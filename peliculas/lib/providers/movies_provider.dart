import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a1cce87ec8ce08701ddc62e5b4c92b7e';
  String _language = 'es-ES';
  String _baseUrl = 'api.themoviedb.org';

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
      final Map<String, dynamic> decodeData = json.decode(uriResponse.body);

      print(decodeData);
    } finally {
      client.close();
    }
  }
}
