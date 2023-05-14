import 'package:manga_easy_ranking/src/features/domain/entities/season_entity.dart';

abstract class SeasonRepository {
  Future<List<SeasonEntity>> getSeason();
}
