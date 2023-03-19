import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/ui/helpers/messages.dart';
import 'package:movie_clean_arch/feature/movie/presentation/controllers/movie_details_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/poster_widget.dart';
import '../widgets/similar_movie_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieDetailsController _movieDetailsController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _movieDetailsController = context.read<MovieDetailsController>();
      _movieDetailsController.getMovie('76600');
      _movieDetailsController.getSimilarMovies('76600');
      _movieDetailsController.addListener(() {
        if (_movieDetailsController.errorMessage != null) {
          Messages.of(context).showError(_movieDetailsController.errorMessage!);
        }
      });
    });
  }

  @override
  void dispose() {
    _movieDetailsController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MovieDetailsController>(
      builder: (context, movieController, child) {
        if (movieController.loadingMovie &&
            movieController.loadigSimilarMovies) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          if (movieController.movie != null) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      PosterWidget(
                        movieTitle: movieController.movie?.title ?? '',
                        posterPath: movieController.movie?.backdropPath,
                        likes:
                            movieController.movie?.voteCount.toString() ?? '0',
                        popularity:
                            movieController.movie?.popularity.toString() ?? '0',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: movieController.similarMovies.length,
                    (context, index) => SimilarMovieWidget(
                        poster:
                            movieController.similarMovies[index].backdropPath,
                        title: movieController.similarMovies[index].title ?? '',
                        subtitle:
                            movieController.similarMovies[index].releaseDate ??
                                ''),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text('ERROR'),
            );
          }
        }
      },
    ));
  }
}
