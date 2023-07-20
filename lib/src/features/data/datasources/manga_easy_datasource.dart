import 'package:ranking/src/features/data/dtos/ranking_dto.dart';
import 'package:ranking/src/features/data/dtos/season_dto.dart';

abstract class MangaEasyDataSource {
  Future<List<SeasonDto>> getSeasons();
  Future<List<RankingDto>> getRanking(String id);
}
