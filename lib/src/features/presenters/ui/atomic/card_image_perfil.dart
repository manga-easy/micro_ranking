import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class CardImagePerfil extends StatelessWidget {
  final double radius;
  final NivelUser nivelUser;
  const CardImagePerfil({
    super.key,
    required this.nivelUser,
    required this.radius,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: carregaInicial(nivelUser.name),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return CircleAvatar(
              radius: radius,
              foregroundImage: MemoryImage(snapshot.data!),
            );

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<Uint8List> carregaInicial(String name) async {
    try {
      if (name.isEmpty) {
        // var not = await rootBundle.load(Assets.soCat.path);
        // return not.buffer.asUint8List();
        return Uint8List(1);
      }
      // return await di.get<IDatabaseNuvem>().getInitials(name: name);
    } catch (e) {
      return Uint8List(1);
    }
    return Uint8List(1);
  }
}
