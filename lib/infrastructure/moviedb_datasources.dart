import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entitties/movie.dart';

class MoviedbDatasources extends MovieDatasource {
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return [];
    // TODO: implement getNowPlaying
    // throw UnimplementedError();
  }
}
