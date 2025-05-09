//como este va a ser un provider de un repository, no es necesario el change notifier

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasources.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasources());
});
