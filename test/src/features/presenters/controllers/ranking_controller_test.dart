import 'package:client_driver/client_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_ranking/manga_easy_ranking.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/ranking_entity.dart';
import 'package:manga_easy_ranking/src/features/domain/entities/season_entity.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_ranking/src/features/presenters/ui/states/status_state_imp.dart';

void main() {
  setUpAll(() {
    GetIt.instance.registerFactory<ClientRequest>(
      () => ClientHttp(),
    );
    RankingMicroApp().registerDependencies();
  });

  test(
      ''' Temporada
      1 - Verifica se o nome da temporada foi retornado corretamente
      2 - Se o estado é FinishedStatusState
      ''',
      () async {
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

  test(
      '''
      Ranking:
      1 - Verifica se o nome do usuário da temporada "63e2f1b96fd9b5a51bfe" foi retornado corretamente 
      2 - Se o estado é FinishedStatusState
      ''',
      () async {
    RankingController controller = GetIt.I();

    final ranking = [
      RankingEntity(
        username: 'ygor',
        total: 206954,
        temp: '63e2f1b96fd9b5a51bfe',
        level: 74,
        createdHour: 1675875574231,
        quantity: 924,
        minute: 103470,
        userid: '629bfc0e8c808108623a',
        uid: '63e3d4f65b12ce723a58',
        timeup: 1683275547983,
        createdAt: 1675875574,
        updatedAt: 1683312711,
      ),
    ];

    final rankingLoaded = await controller.loadRanking('63e2f1b96fd9b5a51bfe');

    expect(rankingLoaded[0].username, equals(ranking[0].username));
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
