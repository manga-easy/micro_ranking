import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:ranking/src/features/presenters/ui/atomic/user_avatar.dart';
import 'package:ranking/src/features/presenters/ui/atomic/ranking_position.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CardSecondarioTop extends StatelessWidget {
  final int rankingPosition;
  final RankingEntity ranking;
  final RankingController ct;

  const CardSecondarioTop({
    super.key,
    required this.ranking,
    required this.rankingPosition,
    required this.ct,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ThemeService.of.backgroundText,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserAvatar(
                ct: ct,
                name: ranking.username,
                typography: CoffeeTypography.body,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CoffeeText(
                  text: ranking.username,
                  color: ThemeService.of.selectText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              RankingPosition(
                size: 20,
                backgroundColor: ThemeService.of.selectColor,
                textColor: ThemeService.of.backgroundText,
                text: '$rankingPosition',
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
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
      ],
    );
  }
}
