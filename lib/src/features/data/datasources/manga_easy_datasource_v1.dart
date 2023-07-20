import 'package:client_driver/client_driver.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:ranking/src/features/data/datasources/manga_easy_datasource.dart';
import 'package:ranking/src/features/data/dtos/ranking_dto.dart';
import 'package:ranking/src/features/data/dtos/season_dto.dart';
import 'package:ranking/src/features/data/mappers/ranking_dto_mapper.dart';
import 'package:ranking/src/features/data/mappers/season_dto_mapper.dart';

class MangaEasyDataSourceV1 implements MangaEasyDataSource {
  final String path = 'seasons';
  final String url = 'https://monolito.lucas-cm.com.br';
  final String version = 'v1';
  final ClientRequest _clientRequest;
  final SeasonDtoMapper _seasonDtoMapper;
  final RankingDtoMapper _rankingDtoMapper;
  final ApiResponseParser _apiErrorService;

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

    var result = _apiErrorService.handleResponse(
      response: response.data,
      statusCode: response.statusCode,
    );

    return result.data.map((e) => _seasonDtoMapper.fromJson(e)).toList();
  }

  @override
  Future<List<RankingDto>> getRanking(String id) async {
    final response = await _clientRequest.get(
      path: '$url/$version/$path/$id/ranking',
    );

    var result = _apiErrorService.handleResponse(
      response: response.data,
      statusCode: response.statusCode,
    );

    return result.data.map((e) => _rankingDtoMapper.fromJson(e)).toList();
  }
}
