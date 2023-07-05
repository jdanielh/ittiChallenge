import 'package:http/http.dart' as http;
import 'package:itti_challenge_flutter/app/home/data/datasources/home_remote_datasources.dart';
import 'package:itti_challenge_flutter/app/home/data/repositories/home_repository_impl.dart';
import 'package:itti_challenge_flutter/app/home/domain/repositories/home_repository.dart';
import 'package:itti_challenge_flutter/app/home/domain/usecases/home.dart';
import 'package:itti_challenge_flutter/app/home/presentation/bloc/home_bloc.dart';
import 'package:itti_challenge_flutter/injection_container.dart';

Future<void> init(String env) async {
  //Datasources
  sl.registerLazySingleton<HomeRemoteDataSources>(
      () => HomeRemoteDataSourcesImpl(ittiChallengeClient: sl()));

  //Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSources: sl()));

  //Usecases
  sl.registerLazySingleton(() => Home(homeRepository: sl()));

  //Blocs
  sl.registerFactory(() => HomeBloc(home: sl()));
}
