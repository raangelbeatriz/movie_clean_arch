import 'package:flutter/material.dart';
import 'package:movie_clean_arch/core/extensions/size_extension.dart';
import 'package:movie_clean_arch/feature/movie/presentation/controllers/movie_details_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/poster_widget.dart';
import '../widgets/similar_movies_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MovieDetailsController>().getMovie('934433');
      context.read<MovieDetailsController>().getSimilarMovies('934433');
    });
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
                    (context, index) => SimilarMoviesWidget(
                        poster:
                            movieController.similarMovies[index].backdropPath,
                        title: movieController.similarMovies[index].title ?? '',
                        subtitle: 'teste'),
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
