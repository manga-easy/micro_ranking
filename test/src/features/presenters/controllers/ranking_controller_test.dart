import 'package:client_driver/client_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:ranking/src/features/domain/entities/season_entity.dart';
import 'package:ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:ranking/src/features/presenters/ui/states/status_state_imp.dart';
import 'package:ranking/src/microapp/ranking_microapp.dart';

void main() {
  setUpAll(() {
    GetIt.instance.registerFactory<ClientRequest>(
      () => ClientHttp(),
    );
    RankingMicroApp().registerDependencies();
  });

  test(''' Temporada
      1 - Verifica se o nome da temporada foi retornado corretamente
      2 - Se o estado é FinishedStatusState
      ''', () async {
    RankingController controller = GetIt.I();
    final seasons = [
      SeasonEntity(
        id: '62e741f300197705caf5',
        nome: 'Temporada 1',
        number: 1,
        createdAt: 0,
        updatedAt: 0,
      ),
    ];

    await controller.loadSeasons();

    final seasonsLoaded = List.generate(
      controller.seasons.length,
      (index) => SeasonEntity(
        id: controller.seasons[index].id,
        nome: controller.seasons[index].nome,
        number: controller.seasons[index].number,
        createdAt: controller.seasons[index].createdAt,
        updatedAt: controller.seasons[index].updatedAt,
      ),
    );

    expectLater(seasonsLoaded[0].nome, seasons[0].nome);
    expectLater(controller.state.value, isA<FinishedStatusState>());
  });

  // test(
  //     '''Temporadas
  //     Verifica se o estado fica NotFoundStatusState quando não retona as Temporadas
  //     ''',
  //     () async {
  //   RankingController controller = GetIt.I();
  //   // await controller.loadSeasons();
  //   expect(controller.seasons, isEmpty);
  //   expect(controller.state.value, isA<NotFoundStatusState>());
  // });

  test('''
      Ranking:
      1 - Verifica se o nome do usuário da temporada "64500df828ed1318864e" foi retornado corretamente 
      2 - Se o estado é FinishedStatusState
      ''', () async {
    RankingController controller = GetIt.I();
    await controller.init();
    List<RankingEntity> rankingLoaded =
        await controller.loadRanking('64500df828ed1318864e');

    final ranking = [
      RankingEntity(
        username: 'Wuhl S',
        total: 225413,
        temp: '63e2f1b96fd9b5a51bfe',
        level: 77,
        createdHour: 1675884546129,
        quantity: 2715,
        minute: 112431,
        userid: '62a12ecf5378af951ee0',
        uid: '63e3f803931cccfec6b2',
        timeup: 1684118651289,
        createdAt: 1675884547,
        updatedAt: 1684118675,
      ),
    ];

    expectLater(rankingLoaded[0].username, equals(ranking[0].username));
    expect(controller.state.value, isA<FinishedStatusState>());
  });

  // test(
  //     '''Rankings
  //      Verifica se o estado fica NotFoundStatusState quando não retona os Rankings
  //      ''',
  //     () async {
  //   RankingController controller = GetIt.I();
  //   final ranking = await controller.loadRanking('1');

  //   expect(ranking, isEmpty);
  //   expect(controller.state.value, isA<NotFoundStatusState>());
  // });
}
