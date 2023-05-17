import 'package:client_driver/client_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manga_easy_ranking/src/core/services/api_error_service.dart';
import 'package:manga_easy_ranking/src/features/data/datasources/manga_easy_datasource_v1.dart';
import 'package:manga_easy_ranking/src/features/data/mappers/ranking_dto_mapper.dart';
import 'package:manga_easy_ranking/src/features/data/mappers/season_dto_mapper.dart';

void main() {
  SeasonDtoMapper seasonMapper = SeasonDtoMapper();
  RankingDtoMapper rankingMapper = RankingDtoMapper();
  var datasource = MangaEasyDataSourceV1(
    ClientHttp(),
    seasonMapper,
    ApiErrorService(),
    rankingMapper,
  );

  group('Retornos da api de Temporadas com sucesso', () {
    test('Verifica se o retorno não é vazio', () async {
      expectLater(await datasource.getSeasons(), isNotEmpty);
    });

    test('Retorna cada dado da temporada 1', () async {
      var response = await datasource.getSeasons();
      var result = seasonMapper.toEntity(response.first);

      expect(result.id, '62e741f300197705caf5');
      expect(result.nome, 'Temporada 1');
      expect(result.number, 1);
      expect(result.updatedAt, 0);
      expect(result.createdAt, 0);
    });
  });

  group('Retornos da api de Ranking com sucesso', () {
    String temp4 = '63e2f1b96fd9b5a51bfe';
    test('Verifica se o retorno não é vazio', () async {
      expect(await datasource.getRanking(temp4), isNotEmpty);
    });

    test('Retorna dados do rank 1', () async {
      var response = await datasource.getRanking(temp4);
      var result = rankingMapper.toEntity(response.first);

      expect(result.uid, '63e3d4f65b12ce723a58');
      expect(result.username, 'ygor');
      expect(result.total, 206954);
      expect(result.temp, '63e2f1b96fd9b5a51bfe');
      expect(result.level, 74);
      expect(result.createdHour, 1675875574231);
      expect(result.quantity, 924);
      expect(result.minute, 103470);
      expect(result.userid, '63e3d4f65b12ce723a58');
      expect(result.timeup, 1683275547983);
      expect(result.createdAt, 1675875574);
      expect(result.updatedAt, 1683312711);
    });

    test('Verifica se tem 25 ranks', () async {
      var response = await datasource.getRanking(temp4);
      expect(response.length, 25);
    });
  });
}
