import 'package:client_driver/client_driver.dart';
import 'package:manga_easy_ranking/src/core/services/api_forbidden_error.dart';
import 'package:manga_easy_ranking/src/core/services/api_unauthenticated_error.dart';
import 'package:manga_easy_ranking/src/core/services/api_unknown_error.dart';

class ApiErrorService {
  void getError(ResponseRequestEntity response) {
    switch (response.statusCode) {
      case 401:
        throw ApiUnauthenticatedError();
      case 403:
        throw ApiForbiddenError();
      case 0:
      case 500:
        throw ApiUnknownError();
      default:
        throw Exception(
          'Code: ${response.statusCode} - ${response.statusMessage}',
        );
    }
  }
}

