import 'package:manga_easy_ranking/src/features/domain/entities/season_entity.dart';

abstract class GetSeasonsUseCase {
  Future<List<SeasonEntity>> call();
}
