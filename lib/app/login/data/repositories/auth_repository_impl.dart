import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:itti_challenge_flutter/app/login/data/datasources/auth_remote_datasources.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_model.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_request_model.dart';
import 'package:itti_challenge_flutter/app/login/domain/repositories/auth_repository.dart';

import '../../../../../core/errors/failures.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;

  AuthRepositoryImpl({required this.authRemoteDataSources});

  @override
  Future<Either<Failure, Usermodel>> post({
    required UserRequestModel userData,
  }) async {
    try {
      final result = await authRemoteDataSources.login(userData);

      return Right(Usermodel.fromJson(result));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
