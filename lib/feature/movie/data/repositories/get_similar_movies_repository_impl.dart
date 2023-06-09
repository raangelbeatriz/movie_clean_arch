import 'dart:developer';

import 'package:movie_clean_arch/feature/movie/domain/entities/movie_details_entity.dart';
import 'package:movie_clean_arch/feature/movie/domain/repositories/get_similiar_movies_repository.dart';

import '../../../../core/data/services/dio_http_service.dart';
import '../../../../core/exceptions/movie_exception.dart';
import '../../../../core/utils/keys.dart';
import '../dto/movie_dto.dart';

class GetSimilarMoviesRepositoryImpl implements GetSimiliarMoviesRepository {
  DioHttpImpl _dioHttpImpl;
  GetSimilarMoviesRepositoryImpl(this._dioHttpImpl);
  @override
  Future<List<MovieDetailsEntity>> call(String id) async {
    try {
      List<MovieDetailsEntity> list = [];
      final result =
          await _dioHttpImpl.get('/movie/$id/similar?api_key=${Keys.apiKey}');
      log('The result is $result');
      for (var element in result.data['results']) {
        list.add(MovieDetailsDto.fromJson(element));
      }
      return list;
    } on Exception catch (e, s) {
      log('Error while getting similar movies', error: e, stackTrace: s);
      throw MovieException(message: 'Error while getting similar movies');
    }
  }
}
