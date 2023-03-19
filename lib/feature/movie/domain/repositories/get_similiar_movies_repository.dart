import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';

abstract class GetSimiliarMoviesRepository {
  Future<List<MovieDetailsEntity>> call(String id);
}
