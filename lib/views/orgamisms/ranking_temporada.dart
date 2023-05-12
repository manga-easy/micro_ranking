import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:manga_easy/modules/home/presenter/ui/atoms/nao_encontrei_nada.dart';
import 'package:manga_easy/modules/ranking/controllers/ranking_controller.dart';
import 'package:manga_easy/modules/ranking/widgets/circurlar_destaque.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class RankingTemporada extends StatelessWidget {
  final List<NivelUser> listaNivels;
  final RankingController ct;
  const RankingTemporada(
      {super.key, required this.listaNivels, required this.ct});
  @override
  Widget build(BuildContext context) {
    if (listaNivels.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          NaoEncontrei(msg: "Nenhum nivel ainda"),
        ],
      );
    }
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          'Ranking',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            listaNivels.length >= 2
                ? CircularTopRank(
                    posicao: '2',
                    name: listaNivels.elementAt(1).name,
                    nivel: listaNivels.elementAt(1).lvl,
                    ct: ct,
                  )
                : const SizedBox(width: 1),
            const SizedBox(width: 5),
            CircularTopRank(
              posicao: '1',
              destque: true,
              name: listaNivels.elementAt(0).name,
              nivel: listaNivels.elementAt(0).lvl,
              ct: ct,
            ),
            const SizedBox(width: 5),
            listaNivels.length >= 3
                ? CircularTopRank(
                    posicao: '3',
                    name: listaNivels.elementAt(2).name,
                    nivel: listaNivels.elementAt(2).lvl,
                    ct: ct,
                  )
                : const SizedBox(width: 1),
          ],
        ),
        const SizedBox(height: 15),
        listaNivels.length > 4
            ? Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white,
                      thickness: .1,
                      height: 20,
                    ),
                    itemCount:
                        listaNivels.getRange(3, listaNivels.length - 1).length,
                    itemBuilder: (context, index) {
                      var nv = listaNivels
                          .getRange(3, listaNivels.length - 1)
                          .elementAt(index);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${index + 4}'),
                              const SizedBox(width: 20),
                              FutureBuilder<Uint8List>(
                                future: ct.carregaInicial(nv.name),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.done:
                                      return CircleAvatar(
                                        radius: 23,
                                        backgroundImage: MemoryImage(
                                          Uint8List.fromList(
                                            snapshot.data!,
                                          ),
                                        ),
                                      );

                                    default:
                                      return const CircularProgressIndicator();
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nv.name.isEmpty ? 'N/A' : nv.name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                'Nivel Atual ${nv.lvl}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                '${nv.quantity} xp',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            : const SizedBox(width: 1),
      ],
    );
  }
}
