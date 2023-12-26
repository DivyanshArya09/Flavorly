class CacheException implements Exception {}

class ConnectionException implements Exception {}

class ServerException implements Exception {
  final String? message;
  ServerException({this.message});
}
