part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final FormzStatus status;
  final String errorMessage;

  AuthState({
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  AuthState copyWith({FormzStatus? status, String? errorMessage}) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage];
}

class EmptyLoginMethod extends AuthState {
  EmptyLoginMethod();

  @override
  List<Object> get props => [];
}

class LoadingLogintMethod extends AuthState {
  LoadingLogintMethod();

  @override
  List<Object> get props => [];
}

class LoadedLoginMethod extends AuthState {
  final Usermodel user;

  LoadedLoginMethod({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class ErrorLoginMethod extends AuthState {
  final String message;

  ErrorLoginMethod({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

// Cerrar sesión
class LoadingLogout extends AuthState {
  LoadingLogout();

  @override
  List<Object> get props => [];
}

class LoadedLogout extends AuthState {
  LoadedLogout();

  @override
  List<Object> get props => [];
}

class ErrorLogout extends AuthState {
  final String message;

  ErrorLogout({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
