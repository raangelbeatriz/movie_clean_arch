import 'package:flutter_test/flutter_test.dart';
import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';

void main() {
  test('Should return an instance of MovieEntity', () {
    MovieDetailsEntity movie = MovieDetailsEntity(
        backdropPath: "/ae4xZiU7IeFVrvXxm2GjdcTrBm.jpg",
        id: 934433,
        releaseDate: "2023-03-08",
        popularity: 2.0,
        posterPath: '/ae4xZiU7IeFVrvXxm2GjdcTrBm.jpg',
        title: 'Everything Everywhere all at once',
        voteCount: 9);
    expect(movie, isNotNull);
  });
}
