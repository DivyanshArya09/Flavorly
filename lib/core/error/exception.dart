import 'package:equatable/equatable.dart';

class CacheException implements Exception {}

class ConnectionException implements Exception {}

class ServerException implements Exception, Equatable {
  final String? message;
  ServerException({this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => throw UnimplementedError();
}
