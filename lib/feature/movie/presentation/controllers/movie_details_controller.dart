import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_movie_usecase.dart';
import 'package:movie_clean_arch/feature/movie/domain/usecases/get_similar_movies_usecase.dart';

import '../../../../core/exceptions/movie_exception.dart';

class MovieDetailsController extends ChangeNotifier {
  GetMovieUseCase _getMovieUseCase;
  GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  MovieDetailsController(this._getMovieUseCase, this._getSimilarMoviesUseCase);
  bool loadingMovie = false;
  bool loadigSimilarMovies = false;

  MovieDetailsEntity? movie;
  List<MovieDetailsEntity> similarMovies = [];

  Future<void> getMovie(String id) async {
    try {
      loadingMovie = true;
      notifyListeners();
      movie = await _getMovieUseCase(id);
      log(movie.toString());
    } on MovieException catch (e, s) {
      log(e.message, stackTrace: s);
    } finally {
      loadingMovie = false;
      notifyListeners();
    }
  }

  Future<void> getSimilarMovies(String id) async {
    try {
      loadigSimilarMovies = true;
      notifyListeners();
      similarMovies = await _getSimilarMoviesUseCase(id);
    } on MovieException catch (e, s) {
      log(e.message, stackTrace: s);
    } finally {
      loadingMovie = false;
      notifyListeners();
    }
  }
}
