import 'package:flutter/material.dart';
import 'package:manga_easy/core/config/app_assets.dart';
import 'package:manga_easy/core/config/helpes.dart';
import 'package:manga_easy/modules/ranking/views/atoms/card_image_perfil.dart';
import 'package:manga_easy/modules/ranking/views/orgamisms/ranking_temporada_new.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';

class CardFirstTop extends StatelessWidget {
  final NivelUser nivel;
  const CardFirstTop({super.key, required this.nivel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: mineShaft,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nivel ${nivel.lvl}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: webOrange,
                    ),
              ),
              Text(
                '${nivel.quantity} XP',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: webOrange,
                    ),
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
              CircleAvatar(
                radius: 28,
                backgroundColor: webOrange,
                child: CardImagePerfil(
                  nivelUser: nivel,
                  radius: 25,
                ),
              ),
              Text(
                AppHelps.limitaTitle(nivel.name, 22),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ThemeService.of.primaryText,
                    ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Assets.losango.path,
                    width: 35,
                    height: 35,
                    color: webOrange,
                  ),
                  Text(
                    '1',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ThemeService.of.primaryColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
