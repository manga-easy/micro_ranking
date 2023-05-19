import 'package:client_driver/client_driver.dart';
import 'package:manga_easy_ranking/src/core/request/result_entity.dart';
import 'package:manga_easy_ranking/src/core/services/api_error_service.dart';

import 'package:manga_easy_ranking/src/features/data/datasources/manga_easy_datasource.dart';
import 'package:manga_easy_ranking/src/features/data/dtos/ranking_dto.dart';
import 'package:manga_easy_ranking/src/features/data/dtos/season_dto.dart';
import 'package:manga_easy_ranking/src/features/data/mappers/ranking_dto_mapper.dart';
import 'package:manga_easy_ranking/src/features/data/mappers/season_dto_mapper.dart';

class MangaEasyDataSourceV1 implements MangaEasyDataSource {
  final String path = 'seasons';
  final String url = 'https://monolito.lucas-cm.com.br';
  final String version = 'v1';
  final ClientRequest _clientRequest;
  final SeasonDtoMapper _seasonDtoMapper;
  final RankingDtoMapper _rankingDtoMapper;
  final ApiErrorService _apiErrorService;

  MangaEasyDataSourceV1(
    this._clientRequest,
    this._seasonDtoMapper,
    this._apiErrorService,
    this._rankingDtoMapper,
  );

  @override
  Future<List<SeasonDto>> getSeasons() async {
    final response = await _clientRequest.get(
      path: '$url/$version/$path/list',
    );
    if (response.statusCode != 200) {
      _apiErrorService.getError(response);
    }

    final result = ResultEntity.fromJson(response.data);

    if (result.status == 'ERROR') {
      throw Exception(result.message);
    }

    return result.data.map((e) => _seasonDtoMapper.fromJson(e)).toList();
  }

  @override
  Future<List<RankingDto>> getRanking(String id) async {
    final response = await _clientRequest.get(
      path: '$url/$version/$path/$id/ranking',
    );

    if (response.statusCode != 200) {
      _apiErrorService.getError(response);
    }

    final result = ResultEntity.fromJson(response.data);

    if (result.status == 'ERROR') {
      throw Exception(result.message);
    }

    return result.data.map((e) => _rankingDtoMapper.fromJson(e)).toList();
  }
}
