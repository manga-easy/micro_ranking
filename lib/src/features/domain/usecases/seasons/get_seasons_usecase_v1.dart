import 'package:ranking/src/features/domain/entities/season_entity.dart';
import 'package:ranking/src/features/domain/repositories/season_repository.dart';
import 'package:ranking/src/features/domain/usecases/seasons/get_seasons_usecase.dart';

class GetSeasonsUsecaseV1 implements GetSeasonsUseCase {
  final SeasonRepository _seasonRepository;
  GetSeasonsUsecaseV1(this._seasonRepository);

  @override
  Future<List<SeasonEntity>> call() async {
    return await _seasonRepository.getSeason();
  }
}