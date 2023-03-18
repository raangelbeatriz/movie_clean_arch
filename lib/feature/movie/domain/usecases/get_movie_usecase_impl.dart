import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_movie_repository.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_movie_usecase.dart';

class GetMovieUseCaseImpl implements GetMovieUseCase {
  final GetMovieRepository _getMovieRepository;

  GetMovieUseCaseImpl(this._getMovieRepository);

  @override
  Future<MovieDetailsEntity> call(String id) => _getMovieRepository(id);
}
