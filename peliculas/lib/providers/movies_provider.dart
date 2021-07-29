import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() {
    print('getOnDisplayMovies');
  }
}
