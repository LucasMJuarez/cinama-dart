import 'package:cinemapedia/config/domain/entitties/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
