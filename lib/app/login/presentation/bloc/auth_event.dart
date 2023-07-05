part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RetrieveLoginSubmittedMethod extends AuthEvent {
  final UserRequestModel userBodyRequestModel;

  const RetrieveLoginSubmittedMethod({required this.userBodyRequestModel});

  @override
  List<Object> get props => [userBodyRequestModel];
}
