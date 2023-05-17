import 'package:coffee_cup/features/assets/assets_unicorn.dart';
import 'package:coffee_cup/features/images/coffee_image.dart';
import 'package:coffee_cup/features/text/coffee_text.dart';
import 'package:flutter/material.dart';

class ApiErrorWidget extends StatelessWidget {
  final String error;
  const ApiErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CoffeeImage.unicorn(
          AssetsUnicorn.fire,
          width: size.width * .45,
        ),
        const SizedBox(
          height: 12,
        ),
        CoffeeText(
          text: error,
        ),
      ],
    );
  }
}
