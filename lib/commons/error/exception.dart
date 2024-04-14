
import 'package:wahg_v1/commons/error/failure.dart';

class ServerException implements Exception {
   final ErrorMessage errorMessage;
   ServerException(this.errorMessage);
}

class CacheException implements Exception {}
