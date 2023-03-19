import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';

abstract class GetMovieRepository {
  Future<MovieDetailsEntity> call(String id);
}
