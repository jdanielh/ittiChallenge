import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_model.dart';

import '../../data/models/user_request_model.dart';

import '../../domain/usecases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final box = GetStorage();

  AuthBloc({required this.login}) : super(EmptyLoginMethod()) {
    on<RetrieveLoginSubmittedMethod>(_mapRetrieveLoginSubmittedMethodToState);
  }

  void _mapRetrieveLoginSubmittedMethodToState(
    RetrieveLoginSubmittedMethod event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingLogintMethod());
    final user = Usermodel(
        id: 1,
        firstName: "Juan",
        lastName: "Perez",
        login: "Juan",
        email: "Juan@gmai.com",
        permissions: "",
        authentication: "");
    emit(LoadedLoginMethod(user: user));

    // final result =
    //     await login(LoginUserParams(data: event.userBodyRequestModel));

    // print(result);

    // if (result.isRight()) {
    //   /// Save User Authentication
    //   final user = (result as Right).value;

    //   box.write('userId', user.id);
    //   box.write('Name', user.firstName);
    //   box.write('LastName', user.lastName);
    //   box.write('email', user.email);
    //   box.write('authentication', user.authentication);

    //   emit.call(LoadedLoginMethod(user: user));
    // }

    // if (result.isLeft()) {
    //   final failure = (result as Left).value;
    //   emit.call(ErrorLoginMethod(
    //       message: failure?.message ?? 'Hubo un error en el servicio'));
    // }
  }
}
