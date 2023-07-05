import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:itti_challenge_flutter/app/home/data/models/home_model.dart';
import 'package:itti_challenge_flutter/app/home/domain/repositories/home_repository.dart';
import 'package:itti_challenge_flutter/core/errors/failures.dart';
import 'package:itti_challenge_flutter/core/ui/usecase/usecase.dart';

class Home extends UseCase<HomeModel, NoParams> {
  final HomeRepository homeRepository;

  Home({required this.homeRepository});

  @override
  Future<Either<Failure, HomeModel>> call(NoParams params) async {
    return await homeRepository.getHome();
  }
}
