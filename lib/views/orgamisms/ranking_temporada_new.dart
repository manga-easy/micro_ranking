import 'package:flutter/material.dart';
import 'package:manga_easy/modules/ranking/views/atoms/card_first_top.dart';
import 'package:manga_easy/modules/ranking/views/atoms/card_normal_top.dart';
import 'package:manga_easy/modules/ranking/views/atoms/card_secondario_top.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

final brightSun = ThemeService.of.primaryColor;
const mirage = Color(0xFF1e2237);
final webOrange = ThemeService.of.primaryText;
const milkPunch = Color(0xfffff7d8);
const cerulean = Color(0xff009bd6);
const codGray = Color(0xff121212);
const mineShaft = Color(0xff312f2f);

class RankingTemporadaNew extends StatelessWidget {
  final List<NivelUser> listaNivels;
  const RankingTemporadaNew({
    super.key,
    required this.listaNivels,
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
          //CardTemporada(),
          //const SizedBox(height: 15),
          CardFirstTop(nivel: listaNivels.elementAt(0)),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  child: CardSecondarioTop(
                nivel: listaNivels.elementAt(1),
                numero: '2',
              )),
              const SizedBox(width: 5),
              Expanded(
                  child: CardSecondarioTop(
                nivel: listaNivels.elementAt(2),
                numero: '3',
              )),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: listaNivels.skip(3).toList().length,
              separatorBuilder: (context, index) => const Divider(
                color: mineShaft,
              ),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CardNormalTop(
                nivelUser: listaNivels.skip(3).toList()[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
