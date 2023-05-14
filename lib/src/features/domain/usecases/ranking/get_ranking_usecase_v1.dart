// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/domain/repositories/ranking_repository.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/ranking/get_ranking_usecase.dart';

class GetRankingUseCaseV1 implements GetRankingUseCase {
  final RankingRepository _rankingRepository;
  GetRankingUseCaseV1(this._rankingRepository);

  @override
  Future<List<RankingEntity>> getRanking(String id) async {
    return await _rankingRepository.getRanking(id);
  }
}
