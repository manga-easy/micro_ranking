import 'package:flutter/material.dart';
import 'package:manga_easy/main.dart';
import 'package:manga_easy/modules/ranking/controllers/ranking_controller.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';

class RankingModule extends MicroApp {
  @override
  Map<String, Widget> routers = {};

  @override
  void registerDependencies() {
    di.registerLazySingleton(
      () => RankingController(
        app: di(),
      ),
    );
  }
}
