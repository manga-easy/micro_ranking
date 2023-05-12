import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_easy/core/config/app_assets.dart';
import 'package:manga_easy/core/config/controller_inter.dart';
import 'package:manga_easy/core/services/appwrite.dart';
import 'package:manga_easy/modules/home/presenter/ui/organismos/content_inicial.dart';
import 'package:manga_easy_sdk/manga_easy_sdk.dart';

class RankingController extends IController {
  final IDatabaseNuvem app;

  var status = ValueNotifier(StatusTitle.carregando);
  List<TemporadaModel> temporadas = [];

  RankingController({
    required this.app,
  });

  @override
  void dispose() {
    status.dispose();
    super.dispose();
  }

  @override
  Future<void> init(BuildContext context) async {
    await carregaTemporadas();
  }

  Future<void> carregaTemporadas() async {
    try {
      if (temporadas.isNotEmpty) {
        return;
      }
      var ret = await app.listDocuments(
        collectionId: TemporadaModel.collectionId,
        orderAttribute: ['number'],
        orderTypes: ['ASC'],
      );
      temporadas = [
        TemporadaModel(
          id: '',
          datafim: DateTime.now().millisecondsSinceEpoch,
          datainit: DateTime.now().millisecondsSinceEpoch,
          nome: 'Temporada 0',
          number: 0,
        ),
        ...ret.documents.map((e) => TemporadaModel.fromJson(e.data)).toList(),
      ];
    } catch (e) {
      status.value = StatusTitle.notfoud;
      Helps.log(e);
    }
    status.value = StatusTitle.finalizado;
  }

  Future<List<NivelUser>> carregaRanking(String temporada) async {
    try {
      var listaNivels = <NivelUser>[];
      var ret = await app.listDocuments(
        collectionId: NivelUser.collectionId,
        orderAttribute: ['lvl'],
        orderTypes: ['DESC'],
        limit: 100,
        filters: [Query.equal('temporada', temporada)],
      );
      listaNivels =
          ret.documents.map((e) => NivelUser.fromJson(e.data)).toList();
      listaNivels.sort(sorts);

      status.value = StatusTitle.finalizado;
      return listaNivels;
    } catch (e) {
      status.value = StatusTitle.notfoud;
      Helps.log(e);
      return [];
    }
  }

  Future<Uint8List> carregaInicial(String name) async {
    try {
      if (name.isEmpty) {
        var not = await rootBundle.load(Assets.soCat.path);
        return not.buffer.asUint8List();
      }
      return await app.getInitials(name: name);
    } catch (e) {
      return Uint8List(1);
    }
  }

  int sorts(NivelUser a, NivelUser b) {
    final propertyA = a.lvl;
    final propertyB = b.lvl;
    if (propertyA > propertyB) {
      return -1;
    } else if (propertyA < propertyB) {
      return 1;
    } else {
      final protA = a.quantity;
      final protB = b.quantity;
      if (protA > protB) {
        return -1;
      } else if (protA < protB) {
        return 1;
      } else {
        return 0;
      }
    }
  }
}
