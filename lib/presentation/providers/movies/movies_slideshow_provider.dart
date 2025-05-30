import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(
    nowPlayingMoviesProvider,
  ); //aca ya obtengo las peliculas que se estan reproduciendo
  if (nowPlayingMovies.isEmpty) {
    return [];
  }

  return nowPlayingMovies.sublist(0, 6);
});
