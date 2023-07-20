import 'package:ranking/src/features/data/datasources/manga_easy_datasource.dart';
import 'package:ranking/src/features/data/mappers/ranking_dto_mapper.dart';
import 'package:ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:ranking/src/features/domain/repositories/ranking_repository.dart';

class RankingRepositoryV1 implements RankingRepository {
  final MangaEasyDataSource _mangaEasyDataSource;
  final RankingDtoMapper _rankingDtoMapper;

  RankingRepositoryV1(this._mangaEasyDataSource, this._rankingDtoMapper);

  @override
  Future<List<RankingEntity>> getRanking(String id) async {
    var rankings = await _mangaEasyDataSource.getRanking(id);
    var result = rankings.map((e) => _rankingDtoMapper.toEntity(e)).toList();
    return result;
  }
}
