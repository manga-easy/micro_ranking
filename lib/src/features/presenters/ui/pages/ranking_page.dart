import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_ranking/src/core/services/api_error.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/molecules/api_error_widget.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/molecules/rankings.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state_imp.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final RankingController ct = GetIt.I();
  @override
  void initState() {
    ct.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: ct.state,
        builder: (context, StatusState state, child) {
          if (state is LoadingStatusState) {
            return const Scaffold(
              body: Center(
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (state is NotFoundStatusState) {
            return const ApiErrorWidget(
              error: 'Ocorreu algum erro, tente novamente mais tarde!',
            );
          }
          return DefaultTabController(
            initialIndex: ct.seasons.length - 1,
            length: ct.seasons.length,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    color: ThemeService.of.selectText,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: ThemeService.of.primaryColor,
                      labelColor: ThemeService.of.backgroundText,
                      tabs: ct.seasons
                          .map(
                            (e) => Tab(
                              text: e.nome,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                    // TODO: CRIAR BUILDER PARA RENDERIZAR CADA TEMPORADA INDIVIDUALMENTE
                    child: TabBarView(
                      children: ct.seasons
                          .map(
                            (e) => FutureBuilder<List<RankingEntity>>(
                              future: ct.loadRanking(e.id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Ranking(
                                    ct: ct,
                                    rankingList: snapshot.data!,
                                  );
                                }
                                if (snapshot.hasError) {
                                  var error = snapshot.error;
                                  if (error is ApiError) {
                                    return ApiErrorWidget(error: error.message);
                                  }
                                  if (error is Exception) {
                                    return ApiErrorWidget(
                                      error:
                                          'Ocorreu algum erro, tente novamente mais tarde!',
                                    );
                                  }
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
