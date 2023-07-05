import 'package:dartz/dartz.dart';
import 'package:itti_challenge_flutter/app/home/data/models/home_model.dart';
import 'package:itti_challenge_flutter/core/errors/failures.dart';

import 'package:equatable/equatable.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHome();
}
