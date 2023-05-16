import 'package:manga_easy_ranking/src/core/services/api_error.dart';

class ApiForbiddenError implements ApiErro {
  @override
  String message = 'Acesso negado';
}
