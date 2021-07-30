import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: _size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: _size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: _size.width * 0.45,
        itemHeight: _size.height * 0.45,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          print(movie.posterPath);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Redondea los bordes
              child: FadeInImage(
                placeholder: AssetImage(
                    'assets/no-image.jpg'), // Se debe registrar el recurso en el pubspec.yaml
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
