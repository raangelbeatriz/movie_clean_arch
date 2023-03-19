import '../entities/movie_details_entity.dart';

abstract class GetSimilarMoviesUseCase {
  Future<List<MovieDetailsEntity>> call(String id);
}
