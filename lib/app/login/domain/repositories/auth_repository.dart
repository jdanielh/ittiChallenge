import 'package:dartz/dartz.dart';
import 'package:itti_challenge_flutter/app/login/data/models/user_request_model.dart';
import 'package:itti_challenge_flutter/core/errors/failures.dart';

import '../../data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthRepository {
  Future<Either<Failure, Usermodel>> post({required UserRequestModel userData});
}
