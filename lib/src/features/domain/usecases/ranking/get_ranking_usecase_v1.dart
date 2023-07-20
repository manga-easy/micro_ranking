import 'package:ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:ranking/src/features/domain/repositories/ranking_repository.dart';
import 'package:ranking/src/features/domain/usecases/ranking/get_ranking_usecase.dart';

class GetRankingUseCaseV1 implements GetRankingUseCase {
  final RankingRepository _rankingRepository;
  GetRankingUseCaseV1(this._rankingRepository);

  @override
  Future<List<RankingEntity>> getRanking(String id) async {
    return await _rankingRepository.getRanking(id);
  }
}
