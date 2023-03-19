import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_movie_repository.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_movie_usecase.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_movie_usecase_impl.dart';

import 'get_movie_usecase_test.mocks.dart';

@GenerateMocks([GetMovieRepository])
void main() {
  late GetMovieRepository movieRepositoryMock;
  late GetMovieUseCase useCase;

  setUp(() {
    movieRepositoryMock = MockGetMovieRepository();
    useCase = GetMovieUseCaseImpl(movieRepositoryMock);
  });

  test('Should return an instance of the MovieDetailsEntity', () async {
    when(useCase('123')).thenAnswer((_) async => MovieDetailsEntity(id: 1));
    final result = await useCase('123');
    expect(result, isInstanceOf<MovieDetailsEntity>());
  });

  test('should throw an exception', () {
    when(useCase('123')).thenAnswer((_) async {
      throw Exception('Error while getting move');
    });
    final movie = useCase('123');
    expect(movie, throwsException);
  });
}
