import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';
import 'package:get_it/get_it.dart';

import '../features/presenters/ui/pages/ranking_page.dart';

class RankingMicroApp extends MicroApp {
  GetIt getIt = GetIt.I;

  @override
  Map<String, Widget> routers = {'RankingPage.route': const RankingPage()};

  @override
  void registerDependencies() {
    // controllers
    getIt.registerLazySingleton(
      () => RankingController(),
    );
  }
}
