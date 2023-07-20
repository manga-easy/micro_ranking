import 'package:ranking/src/features/domain/entities/ranking_entity.dart';

abstract class GetRankingUseCase {
  Future<List<RankingEntity>> getRanking(String id);
}