import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:itti_challenge_flutter/app/home/data/models/home_model.dart';
import 'package:itti_challenge_flutter/app/home/domain/usecases/home.dart';
import 'package:itti_challenge_flutter/core/ui/usecase/usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Home home;
  HomeBloc({required this.home}) : super(HomeInitial()) {
    on<Empty>(_mapCallEmptyHomeToState);
    on<RetrieveHome>(_mapRetrieveHomeSubmittedMethodToState);
  }

  void _mapCallEmptyHomeToState(
    Empty event,
    Emitter<HomeState> emit,
  ) async {
    emit.call(HomeInitial());
  }

  void _mapRetrieveHomeSubmittedMethodToState(
    RetrieveHome event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingHomeMethod());

    final result = await home(NoParams());

    print(result);

    if (result.isRight()) {
      final resultHome = (result as Right).value;

      emit.call(LoadedHomeMethod(home: resultHome));
    }

    if (result.isLeft()) {
      final failure = (result as Left).value;
      emit.call(ErrorHomeMethod(
          message: failure?.message ?? 'Hubo un error en el servicio'));
    }
  }
}
