import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object> get props => [message!];
}

class ServerFailure extends Failure {
  const ServerFailure({String? message}) : super(message: message);
}

class LocalStorageFailure extends Failure {
  const LocalStorageFailure({String? message}) : super(message: message);
}

class LocationFailure extends Failure {
  const LocationFailure({String? message}) : super(message: message);
}
