import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';
import 'card_first_ranking.dart';
import 'card_normal_ranking.dart';
import 'card_sub_ranking.dart';

class Ranking extends StatelessWidget {
  final List<RankingEntity> rankingList;
  final RankingController ct;

  const Ranking({
    super.key,
    required this.rankingList,
    required this.ct,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ranking',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Image.network(
                'https://media.discordapp.net/attachments/906653029170839563/1000820598462742578/foreground_1.png',
                color: ThemeService.of.backgroundText,
              )
            ],
          ),
          CardFirstRanking(
            ranking: rankingList.elementAt(0),
            ct: ct,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: CardSecondarioTop(
                  ct: ct,
                  ranking: rankingList.elementAt(1),
                  rankingPosition: 2,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CardSecondarioTop(
                  ct: ct,
                  ranking: rankingList.elementAt(2),
                  rankingPosition: 3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: rankingList.skip(3).toList().length,
              separatorBuilder: (context, index) => Divider(
                color: ThemeService.of.backgroundColor,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CardNormalRanking(
                ct: ct,
                ranking: rankingList.skip(3).toList()[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
