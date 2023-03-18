import 'package:flutter/material.dart';
import 'package:movie_clean_arch/feature/movie/data/repositories/get_similar_movies_repository_impl.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_similiar_movies_repository.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_similar_movies_usecase_impl.dart';
import 'package:movie_clean_arch/feature/movie/presentation/controllers/movie_details_controller.dart';
import 'package:provider/provider.dart';

import '../../feature/movie/data/repositories/get_movie_repository_impl.dart';
import '../../feature/movie/domain/repositories/get_movie_repository.dart';
import '../../feature/movie/domain/usecases/get_movie_usecase.dart';
import '../../feature/movie/domain/usecases/get_movie_usecase_impl.dart';
import '../data/services/dio_http_service.dart';

class ApplicationBindings extends StatelessWidget {
  final Widget child;
  const ApplicationBindings({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => DioHttpImpl(),
        ),
        Provider<GetMovieRepository>(
          create: (context) => GetMovieRepositoryImpl(
            context.read(),
          ),
        ),
        Provider<GetSimiliarMoviesRepository>(
          create: (context) => GetSimilarMoviesRepositoryImpl(
            context.read(),
          ),
        ),
        Provider<GetMovieUseCase>(
          create: (context) => GetMovieUseCaseImpl(
            context.read(),
          ),
        ),
        Provider<GetSimilarMoviesUseCase>(
          create: (context) => GetSimilarMoviesUseCaseImpl(
            context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              MovieDetailsController(context.read(), context.read()),
        ),
      ],
      child: child,
    );
  }
}
