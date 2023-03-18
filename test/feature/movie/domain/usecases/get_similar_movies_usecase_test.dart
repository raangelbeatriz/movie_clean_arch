import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_similiar_movies_repository.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_similar_movies_usecase_impl.dart';

import 'get_similar_movies_usecase_test.mocks.dart';

@GenerateMocks([GetSimiliarMoviesRepository])
void main() {
  late GetSimiliarMoviesRepository similiarMoviesRepository;
  late GetSimilarMoviesUseCase useCase;

  setUp(() {
    similiarMoviesRepository = MockGetSimiliarMoviesRepository();
    useCase = GetSimilarMoviesUseCaseImpl(similiarMoviesRepository);
  });

  test('Should return a List of Movie Details Entity', () async {
    List<MovieDetailsEntity> expectedList = [];
    when(useCase("123")).thenAnswer((_) async => expectedList);
    final movie = await useCase("123");
    expect(movie, isInstanceOf<List<MovieDetailsEntity>>());
  });

  test('Should return a Populated List of Movie Details Entity', () async {
    List<MovieDetailsEntity> expectedList = [
      MovieDetailsEntity(id: 1),
      MovieDetailsEntity(id: 2)
    ];
    when(useCase("123")).thenAnswer((_) async => expectedList);
    final movie = await useCase("123");
    expect(movie, expectedList);
  });

  test('Should throw a Exception', () async {
    List<MovieDetailsEntity> expectedList = [];
    when(useCase('123')).thenAnswer((_) async {
      throw Exception('Error while getting similar movies');
    });
    final movie = useCase('123');
    expect(movie, throwsException);
  });
}
