import 'package:flutter_test/flutter_test.dart';
import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';

void main() {
  test('Should return an instance of MovieEntity', () {
    MovieDetailsEntity movie = MovieDetailsEntity(
        adult: false,
        backdropPath: "/ae4xZiU7IeFVrvXxm2GjdcTrBm.jpg",
        belongsToCollection: {
          "id": 2602,
          "name": "Scream Collection",
          "poster_path": "/p3EjClFy20jjT0u06dzBs4lvvhi.jpg",
          "backdrop_path": "/dZqsivuEhuHMYgLiMjtMXLImRzE.jpg"
        },
        budget: 35000000,
        id: 934433,
        releaseDate: "2023-03-08",
        popularity: null);
    expect(movie, isNotNull);
  });
}
