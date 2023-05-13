import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

import '../molecules/ranking_temporada_new.dart';
import '../states/status_state_imp.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final RankingController cont = GetIt.I();
  @override
  void initState() {
    cont.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: cont.status,
        builder: (context, StatusState value, child) {
          if (value == LoadingStatusState()) {
            return const CircularProgressIndicator();
          }
          if (value == NotFoundStatusState()) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Não encontrado')],
            );
          }
          return DefaultTabController(
            initialIndex: cont.temporadas.length - 1,
            length: cont.temporadas.length,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    color: ThemeService.of.selectText,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: ThemeService.of.primaryColor,
                      labelColor: ThemeService.of.backgroundText,
                      tabs: cont.temporadas
                          .map((e) => Tab(
                                text: e.nome,
                              ))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: cont.temporadas
                          .map(
                            (e) => FutureBuilder<List<NivelUser>>(
                              future: cont.carregaRanking(e.id!),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return RankingTemporadaNew(
                                      listaNivels: List.generate(
                                    20,
                                    (index) => NivelUser(
                                      timeCria: 12312312312,
                                      lvl: 1,
                                      quantity: 1,
                                      minute: 1,
                                      userId: 'userId',
                                      timeUp: 1,
                                      name: 'name',
                                      total: 1,
                                      temporada: 'temporada',
                                    ),
                                  ));
                                }
                                if (snapshot.hasError) {
                                  return const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // NaoEncontrei(msg: "Deu algum erro"),
                                      Text('Deu algum erro'),
                                    ],
                                  );
                                }
                                return const CircularProgressIndicator();
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
