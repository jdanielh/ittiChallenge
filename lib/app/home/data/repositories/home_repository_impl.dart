import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:itti_challenge_flutter/app/home/data/datasources/home_remote_datasources.dart';
import 'package:itti_challenge_flutter/app/home/data/models/home_model.dart';
import 'package:itti_challenge_flutter/app/home/domain/repositories/home_repository.dart';

import '../../../../../core/errors/failures.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSources homeRemoteDataSources;

  HomeRepositoryImpl({required this.homeRemoteDataSources});

  @override
  Future<Either<Failure, HomeModel>> getHome() async {
    try {
      final result = await homeRemoteDataSources.homeList();

      return Right(HomeModel.fromJson(result));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
