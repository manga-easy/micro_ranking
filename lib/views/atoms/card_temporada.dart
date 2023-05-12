import 'package:flutter/material.dart';

class CardTemporada extends StatelessWidget {
  const CardTemporada({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // IconButton(
        //   onPressed: () => null,
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFF1e2237),
            ),
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Temporada 0',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
        // IconButton(
        //   onPressed: () => null,
        //   icon: Icon(Icons.arrow_forward_ios),
        // ),
      ],
    );
  }
}
