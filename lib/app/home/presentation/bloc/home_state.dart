part of 'home_bloc.dart';

class HomeState extends Equatable {
  FormzStatus status;
  String errorMessage;

  HomeState({
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  HomeState copyWith({FormzStatus? status, String? errorMessage}) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingHomeMethod extends HomeState {
  LoadingHomeMethod();

  @override
  List<Object> get props => [];
}

class LoadedHomeMethod extends HomeState {
  final HomeModel home;

  LoadedHomeMethod({required this.home});

  @override
  List<Object> get props => [home];
}

class ErrorHomeMethod extends HomeState {
  final String message;

  ErrorHomeMethod({required this.message});

  @override
  List<Object> get props => [message];
}
