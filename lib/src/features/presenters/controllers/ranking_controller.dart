import 'package:flutter/material.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/season_entity.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/ranking/get_ranking_usecase.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/seasons/get_seasons_usecase.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state_imp.dart';

class RankingController extends ChangeNotifier {
  final GetRankingUseCase _rankingUseCase;
  final GetSeasonsUseCase _seasonsUseCase;

  RankingController(this._rankingUseCase, this._seasonsUseCase);

  var state = ValueNotifier<StatusState>(NotFoundStatusState());
  List<SeasonEntity> seasons = [];
  List<RankingEntity> ranking = [];
  late String selectedSeason = seasons[0].id;

  Future<void> init() async {
    await loadSeasons();
    await loadRanking(selectedSeason);
  }

  Future<void> loadSeasons() async {
    state.value = LoadingStatusState();
    try {
      if (seasons.isNotEmpty) {
        state.value = FinishedStatusState();
        return;
      }
      seasons = await _seasonsUseCase();
      state.value = FinishedStatusState();
    } catch (e) {
      state.value = NotFoundStatusState();
      Helps.log(e);
    }
    notifyListeners();
  }

  Future<List<RankingEntity>> loadRanking(String id) async {
    state.value = LoadingStatusState();
    try {
      if (ranking.isNotEmpty) {
        state.value = FinishedStatusState();
        // return ranking;
      }
      ranking = await _rankingUseCase.getRanking(id);
      state.value = FinishedStatusState();
      return ranking;
    } catch (e) {
      state.value = NotFoundStatusState();
      Helps.log(e);
    }
    notifyListeners();
    return ranking;
  }

  int sorts(NivelUser a, NivelUser b) {
    final propertyA = a.lvl;
    final propertyB = b.lvl;
    if (propertyA > propertyB) {
      return -1;
    } else if (propertyA < propertyB) {
      return 1;
    } else {
      final protA = a.quantity;
      final protB = b.quantity;
      if (protA > protB) {
        return -1;
      } else if (protA < protB) {
        return 1;
      } else {
        return 0;
      }
    }
  }
}
