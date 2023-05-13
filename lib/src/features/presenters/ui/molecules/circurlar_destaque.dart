import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';

class CircularTopRank extends StatelessWidget {
  final RankingController ct;
  final double radius = 80;
  final bool destque;
  final String posicao;
  final String name;
  final int nivel;

  const CircularTopRank({
    super.key,
    this.destque = false,
    required this.posicao,
    required this.name,
    required this.nivel,
    required this.ct,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: destque ? 0 : 50,
        ),
        Text(
          posicao,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Visibility(
                visible: destque,
                child: Container(
                  width: radius * 1.38,
                  height: radius * 1.38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //     Assets.bordaRank.path,
                    //   ),
                    // ),
                  ),
                ),
              ),
              FutureBuilder<Uint8List>(
                future: ct.carregaInicial(name),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Container(
                        width: radius,
                        height: radius,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          image: DecorationImage(
                            image: MemoryImage(
                              snapshot.data!,
                            ),
                          ),
                        ),
                      );

                    default:
                      return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.only(bottom: destque ? 5 : 0.0),
            color: destque ? const Color(0xffc7903d) : Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              child: Text(
                'Lvl $nivel',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 84),
            // child: Visibility(
            //   visible: destque,
            //   child: Image.asset(
            //     Assets.coroaRank.path,
            //     width: 56,
            //     height: 56,
            //   ),
            // ),
          )
        ]),
        SizedBox(height: destque ? 0 : 5),
        Text(name.isEmpty ? 'N/A' : name),
      ],
    );
  }
}
