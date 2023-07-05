import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_model.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_request_model.dart';
import 'package:itti_challenge_flutter/app/login/domain/repositories/auth_repository.dart';
import 'package:itti_challenge_flutter/core/errors/failures.dart';
import 'package:itti_challenge_flutter/core/ui/usecase/usecase.dart';

class Login extends UseCase<Usermodel, LoginUserParams> {
  final AuthRepository loginRepository;

  Login({required this.loginRepository});

  @override
  Future<Either<Failure, Usermodel>> call(LoginUserParams params) async {
    return await loginRepository.post(userData: params.data);
  }
}

class LoginUserParams extends Equatable {
  final UserRequestModel data;

  const LoginUserParams({required this.data});

  @override
  List<Object> get props => [data];
}
