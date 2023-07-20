import 'package:ranking/src/features/domain/entities/season_entity.dart';

abstract class GetSeasonsUseCase {
  Future<List<SeasonEntity>> call();
}
