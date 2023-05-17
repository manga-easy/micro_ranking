import 'package:coffee_cup/features/text/coffee_text.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/atomic/user_avatar.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CardNormalRanking extends StatelessWidget {
  final RankingEntity ranking;
  final RankingController ct;

  const CardNormalRanking({
    Key? key,
    required this.ranking,
    required this.ct,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            UserAvatar(
              ct: ct,
              name: ranking.username,
              hasBorder: false,
              borderColor: ThemeService.of.backgroundIcon,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoffeeText(text: ranking.username),
                CoffeeText(text: 'Nivel ${ranking.level}')
              ],
            ),
          ],
        ),
        CoffeeText(text: '${ranking.quantity} XP'),
      ],
    );
  }
}
