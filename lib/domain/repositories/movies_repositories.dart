import 'package:cinemapedia/config/domain/entitties/movie.dart';

abstract class MovieRepositories {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
