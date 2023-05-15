import 'package:client_driver/client_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:manga_easy_ranking/manga_easy_ranking.dart';
import 'package:manga_easy_ranking/src/features/domain/repositories/season_repository.dart';

void main() {
  setUpAll(() {
    GetIt.instance.registerFactory<ClientRequest>(
      () => ClientHttp(),
    );
    RankingMicroApp().registerDependencies();
  });

  test('Season não é vazia', () async {
    SeasonRepository seasonRepository = GetIt.I();
    expect(await seasonRepository.getSeason(), isNotEmpty);
  });

  test('Precisa ter 5 seasons', () async {
    SeasonRepository seasonRepository = GetIt.I();
    var result = await seasonRepository.getSeason();
    expect(result.length, 5);
  });
}
