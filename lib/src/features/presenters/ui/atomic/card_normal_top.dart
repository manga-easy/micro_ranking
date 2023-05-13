import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/atomic/card_image_perfil.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class CardNormalTop extends StatelessWidget {
  final NivelUser nivelUser;
  const CardNormalTop({super.key, required this.nivelUser});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CardImagePerfil(
              nivelUser: nivelUser,
              radius: 22,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // AppHelps.limitaTitle(nivelUser.name, 40),
                  nivelUser.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Nivel ${nivelUser.lvl}',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ],
        ),
        Text(
          '${nivelUser.quantity} XP',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
