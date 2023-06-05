import 'package:coffee_cup/coffe_cup.dart';
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
