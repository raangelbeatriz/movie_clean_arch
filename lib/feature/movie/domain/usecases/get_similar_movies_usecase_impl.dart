import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_similiar_movies_repository.dart';

import 'get_similar_movies_usecase.dart';

class GetSimilarMoviesUseCaseImpl implements GetSimilarMoviesUseCase {
  final GetSimiliarMoviesRepository _getSimiliarMoviesRepository;

  GetSimilarMoviesUseCaseImpl(this._getSimiliarMoviesRepository);
  @override
  Future<List<MovieDetailsEntity>> call(String id) =>
      _getSimiliarMoviesRepository(id);
}
