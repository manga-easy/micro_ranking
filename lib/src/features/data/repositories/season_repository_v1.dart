import 'package:ranking/src/features/data/datasources/manga_easy_datasource.dart';
import 'package:ranking/src/features/data/mappers/season_dto_mapper.dart';
import 'package:ranking/src/features/domain/entities/season_entity.dart';
import 'package:ranking/src/features/domain/repositories/season_repository.dart';

class SeasonRepositoryV1 implements SeasonRepository {
  final MangaEasyDataSource _mangaEasyDataSource;
  final SeasonDtoMapper _seasonDtoMapper;
  SeasonRepositoryV1(this._mangaEasyDataSource, this._seasonDtoMapper);

  @override
  Future<List<SeasonEntity>> getSeason() async {
    var seasons = await _mangaEasyDataSource.getSeasons();
    var result = seasons.map((e) => _seasonDtoMapper.toEntity(e)).toList();
    return result;
  }
}
