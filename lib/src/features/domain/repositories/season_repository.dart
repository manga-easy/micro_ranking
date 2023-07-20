import 'package:ranking/src/features/domain/entities/season_entity.dart';

abstract class SeasonRepository {
  Future<List<SeasonEntity>> getSeason();
}
