import 'package:flutter/material.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/season_entity.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/ranking/get_ranking_usecase.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/seasons/get_seasons_usecase.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state_imp.dart';

class RankingController {
  final GetRankingUseCase _rankingUseCase;
  final GetSeasonsUseCase _seasonsUseCase;

  RankingController(this._rankingUseCase, this._seasonsUseCase);

  var state = ValueNotifier<StatusState>(LoadingStatusState());
  List<SeasonEntity> seasons = [];

  Future<void> init() async {
    await loadSeasons();
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
  }

  Future<List<RankingEntity>> loadRanking(String id) async {
    List<RankingEntity> ranking = [];
    ranking = await _rankingUseCase.getRanking(id);
    return ranking;
  }

  String getInitialName(String name) {
    try {
      final nameList = name.trim().split(' ');
      String firstNameInitial = nameList.first.characters.first.toUpperCase();
      if (nameList.length == 1) {
        return firstNameInitial;
      }
      String secondNameInitial = nameList[1].characters.first.toUpperCase();
      return firstNameInitial + secondNameInitial;
    } catch (e) {
      return 'N/A';
    }
  }
}
