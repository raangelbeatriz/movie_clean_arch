class MovieDetailsEntity {
  MovieDetailsEntity({
    required this.backdropPath,
    required this.id,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteCount,
  });

  String backdropPath;
  int id;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  int voteCount;

  @override
  String toString() {
    return 'MovieDetailsEntity(backdropPath: $backdropPath, id: $id, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate,  title: $title, voteCount: $voteCount)';
  }
}
