import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/atomic/user_avatar.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/atomic/ranking_position.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CardFirstRanking extends StatelessWidget {
  final RankingEntity ranking;
  final RankingController ct;

  const CardFirstRanking({super.key, required this.ranking, required this.ct});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: ThemeService.of.selectColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CoffeeText(
                text: 'Nivel ${ranking.level}',
              ),
              CoffeeText(
                text: '${ranking.quantity} XP',
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ThemeService.of.primaryColor,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserAvatar(
                ct: ct,
                name: ranking.username,
                radius: 26,
                typography: CoffeeTypography.title,
              ),
              CoffeeText(
                // AppHelps.limitaTitle(nivel.name, 22),
                text: ranking.username,
                typography: CoffeeTypography.title,
                color: ThemeService.of.primaryText,
              ),
              RankingPosition(
                size: 32,
                backgroundColor: ThemeService.of.backgroundText,
                textColor: ThemeService.of.selectText,
                text: '1',
                typography: CoffeeTypography.title,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
