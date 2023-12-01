import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class SeverFailure extends Failure {
  final String message;

  SeverFailure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'SeverFailure(message: $message)';
  }
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure(this.message);
  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'CacheFailure(message: $message)';
  }
}

class ConnectionFailure extends Failure {
  final String message;
  ConnectionFailure(this.message);
  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'ConnectionFailure(message: $message)';
  }
}

class UnknownError extends Failure {
  final String message;
  UnknownError(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'UnknownError(message: $message)';
  }
}
//! firebase failures

class FireBaseError extends Failure {
  final String message;
  FireBaseError(this.message);

  @override
  List<Object?> get props => [message];
}

class FireStoreError extends Failure {
  final String message;
  FireStoreError(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return 'FireStoreError(message: $message)';
  }
}
