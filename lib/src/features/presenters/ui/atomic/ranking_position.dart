// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_cup/features/text/coffee_text.dart';
import 'package:flutter/material.dart';

class RankingPosition extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final CoffeeTypography? typography;

  const RankingPosition({
    Key? key,
    required this.size,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.typography,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Transform.rotate(
            angle: 45 * 3.1415926535897932 / 180,
            child: Container(color: backgroundColor),
          ),
        ),
        CoffeeText(
          text: text,
          color: textColor,
          typography: typography ?? CoffeeTypography.body,
        ),
      ],
    );
  }
}
