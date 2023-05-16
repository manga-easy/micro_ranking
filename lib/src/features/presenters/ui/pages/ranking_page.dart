import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';
import '../molecules/rankings.dart';
import '../states/status_state_imp.dart';

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
          if (state == LoadingStatusState()) {
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
          if (state == NotFoundStatusState()) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Não encontrado')],
            );
          }
          return DefaultTabController(
            // estava com erro porque não dava tempo de carregar a lista ct.seasons
            initialIndex:
                state == FinishedStatusState() ? ct.seasons.length - 1 : 0,
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
                          .map((e) => Tab(
                                text: e.nome,
                              ))
                          .toList(),
                    ),
                  ),
                  Expanded(
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
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // NaoEncontrei(msg: "Deu algum erro"),
                                      Text(
                                          'Erro: ${snapshot.error.toString()}'),
                                    ],
                                  );
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
