import 'package:flutter/material.dart';
import 'package:manga_easy_ranking/src/core/services/api_error_service.dart';
import 'package:manga_easy_ranking/src/features/data/datasources/manga_easy_datasource.dart';
import 'package:manga_easy_ranking/src/features/data/datasources/manga_easy_datasource_v1.dart';
import 'package:manga_easy_ranking/src/features/data/mappers/ranking_dto_mapper.dart';
import 'package:manga_easy_ranking/src/features/data/mappers/season_dto_mapper.dart';
import 'package:manga_easy_ranking/src/features/data/repositories/ranking_repository_v1.dart';
import 'package:manga_easy_ranking/src/features/data/repositories/season_repository_v1.dart';
import 'package:manga_easy_ranking/src/features/domain/repositories/ranking_repository.dart';
import 'package:manga_easy_ranking/src/features/domain/repositories/season_repository.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/ranking/get_ranking_usecase.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/ranking/get_ranking_usecase_v1.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/seasons/get_seasons_usecase.dart';
import 'package:manga_easy_ranking/src/features/domain/usecases/seasons/get_seasons_usecase_v1.dart';
import 'package:manga_easy_ranking/src/features/presenters/controllers/ranking_controller.dart';
import 'package:manga_easy_routes/manga_easy_routes.dart';
import 'package:get_it/get_it.dart';

import '../features/presenters/ui/pages/ranking_page.dart';

class RankingMicroApp extends MicroApp {
  GetIt getIt = GetIt.instance;

  @override
  Map<String, Widget> routers = {'RankingPage.route': const RankingPage()};

  @override
  void registerDependencies() {
    //service
    getIt.registerFactory<ApiErrorService>(
      () => ApiErrorService(),
    );

    //mappers
    getIt.registerFactory(() => SeasonDtoMapper());
    getIt.registerFactory(() => RankingDtoMapper());

    //datasources
    getIt.registerFactory<MangaEasyDataSource>(
      () => MangaEasyDataSourceV1(getIt(), getIt(), getIt(), getIt()),
    );

    //repositories
    getIt.registerFactory<SeasonRepository>(
      () => SeasonRepositoryV1(getIt(), getIt()),
    );
    getIt.registerFactory<RankingRepository>(
      () => RankingRepositoryV1(getIt(), getIt()),
    );

    //usecases
    getIt.registerFactory<GetSeasonsUseCase>(
      () => GetSeasonsUsecaseV1(getIt()),
    );
    getIt.registerFactory<GetRankingUseCase>(
      () => GetRankingUseCaseV1(getIt()),
    );

    //controllers
    getIt.registerLazySingleton(
      () => RankingController(getIt(), getIt()),
    );

    
  }
}
