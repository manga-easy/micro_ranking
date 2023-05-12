import 'package:flutter/material.dart';
import 'package:manga_easy/main.dart';
import 'package:manga_easy/modules/ranking/controllers/ranking_controller.dart';
import 'package:manga_easy/modules/home/presenter/ui/organismos/content_inicial.dart';
import 'package:manga_easy/modules/home/presenter/ui/atoms/loading.dart';
import 'package:manga_easy/modules/home/presenter/ui/atoms/nao_encontrei_nada.dart';
import 'package:manga_easy/modules/ranking/views/orgamisms/ranking_temporada_new.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final RankingController cont = di();
  @override
  void initState() {
    cont.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cont.status,
      builder: (context, int value, child) {
        if (value == StatusTitle.carregando) {
          return const Loading();
        }
        if (value == StatusTitle.notfoud) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NaoEncontrei(msg: "Deu algum erro"),
            ],
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
                                  listaNivels: snapshot.data!,
                                );
                              }
                              if (snapshot.hasError) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    NaoEncontrei(msg: "Deu algum erro"),
                                  ],
                                );
                              }
                              return const Loading();
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
    );
  }
}
