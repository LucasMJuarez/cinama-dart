import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../../domain/entitties/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slice(movie: movies[index]),
      ),
    );
  }
}

class _Slice extends StatelessWidget {
  final Movie movie;

  const _Slice({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
