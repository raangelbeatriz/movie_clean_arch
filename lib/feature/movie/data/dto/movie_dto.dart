import '../../domain/entities/movie_details_entity.dart';

extension MovieDetailsDto on MovieDetailsEntity {
  Map toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'vote_count': voteCount,
    };
  }

  static MovieDetailsEntity fromJson(Map json) {
    return MovieDetailsEntity(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteCount: json['vote_count'],
    );
  }
}
