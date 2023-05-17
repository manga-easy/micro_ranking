import 'package:manga_easy_ranking/src/core/services/api_error.dart';

class ApiUnauthenticatedError implements ApiError {
  @override
  String message = 'Usuario não autenticado';
}
