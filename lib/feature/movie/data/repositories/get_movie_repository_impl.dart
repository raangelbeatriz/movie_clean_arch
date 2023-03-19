import 'dart:developer';

import 'package:movie_clean_arch/core/data/services/dio_http_service.dart';
import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_movie_repository.dart';

import '../../../../core/exceptions/movie_exception.dart';
import '../../../../core/utils/keys.dart';
import '../dto/movie_dto.dart';

class GetMovieRepositoryImpl implements GetMovieRepository {
  DioHttpImpl _dioHttpImpl;
  GetMovieRepositoryImpl(this._dioHttpImpl);
  @override
  Future<MovieDetailsEntity> call(String id) async {
    try {
      final result =
          await _dioHttpImpl.get('/movie/$id?api_key=${Keys.apiKey}');
      log('The result é $result');
      return MovieDetailsDto.fromJson(result.data);
    } on Exception catch (e, s) {
      log('Error while getting movie', error: e, stackTrace: s);
      throw MovieException(message: 'Error while getting movie');
    }
  }
}
