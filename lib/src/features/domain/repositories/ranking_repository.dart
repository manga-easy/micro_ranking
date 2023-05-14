import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';

abstract class RankingRepository {
  Future<List<RankingEntity>> getRanking(String id);
}