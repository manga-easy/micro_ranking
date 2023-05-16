import 'dart:math';

import 'package:coffee_cup/coffe_cup.dart';
import 'package:flutter/material.dart';
import 'package:manga_easy_themes/manga_easy_themes.dart';
import '../../controllers/ranking_controller.dart';

class UserAvatar extends StatelessWidget {
  final RankingController ct;
  final String name;
  final double? radius;
  final CoffeeTypography? typography;
  final bool hasBorder;
  final Color borderColor;

  const UserAvatar({
    Key? key,
    required this.name,
    required this.ct,
    this.radius = 16,
    this.typography,
    this.hasBorder = true,
    this.borderColor = Colors.black,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final background = getRandomColorBackground();
    final text = ThemeService.of.backgroundText;
    // final randomColor = getRandomColor(background, text);

    return CircleAvatar(
      radius: hasBorder ? radius! + 2 : radius,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: background,
        child: Center(
          child: CoffeeText(
            text: ct.getInitialName(name),
            typography: typography ?? CoffeeTypography.body,
            color: text,
          ),
        ),
      ),
    );
  }

  Color getRandomColor(Color background, Color text) {
    final random = Random();

    // Gerar um valor aleatório entre 0 e 255 para cada canal de cor (vermelho, verde e azul)
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);

    // Calcular a média das cores do fundo e do texto
    final averageBackground =
        (background.red + background.green + background.blue) ~/ 3;
    // final averageText = (text.red + text.green + text.blue) ~/ 3;

    // Verificar qual cor tem a maior média e ajustar a cor gerada de acordo
    final color = averageBackground > 255
        ? Color.fromARGB(255, red, green, blue).withOpacity(0.8)
        : Color.fromARGB(255, red, green, blue);

    return color;
  }

  Color getRandomColorBackground() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
