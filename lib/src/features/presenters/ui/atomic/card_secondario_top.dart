import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/atomic/card_image_perfil.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/molecules/ranking_temporada_new.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class CardSecondarioTop extends StatelessWidget {
  final String numero;
  final NivelUser nivel;
  const CardSecondarioTop({
    super.key,
    required this.nivel,
    required this.numero,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: milkPunch,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: cerulean,
                child: CardImagePerfil(
                  nivelUser: nivel,
                  radius: 13,
                ),
              ),
              Text(
                // AppHelps.limitaTitle(nivel.name, 15),
                nivel.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Image.asset(
                  //   Assets.losango.path,
                  //   width: 18,
                  //   height: 18,
                  //   color: cerulean,
                  // ),
                  Text(
                    numero,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: mineShaft,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nivel ${nivel.lvl}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cerulean,
                    ),
              ),
              Text(
                '${nivel.quantity} XP',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cerulean,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
