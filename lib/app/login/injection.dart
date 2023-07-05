import 'package:itti_challenge_flutter/app/login/data/repositories/auth_repository_impl.dart';
import 'package:itti_challenge_flutter/core/webservices/api/client.dart';
import 'package:itti_challenge_flutter/core/webservices/api/enviroments.dart';

import 'domain/usecases/login.dart';
import '../../injection_container.dart';
import 'presentation/bloc/auth_bloc.dart';
import '../login/domain/repositories/auth_repository.dart';
import '../login/data/datasources/auth_remote_datasources.dart';
import 'package:http/http.dart' as http;

Future<void> init(String env) async {
  Environments environment = Environments(env);
  http.Client client = http.Client();

  sl.registerLazySingleton<IttiChallengeRequestClient>(
    () => IttiChallengeRequestClientImpl(
      env: environment,
      client: client,
    ),
  );
  //Datasources
  sl.registerLazySingleton<AuthRemoteDataSources>(
      () => AuthRemoteDataSourcesImpl(ittiChallengeClient: sl()));

  //Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSources: sl()));

  //Usecases
  sl.registerLazySingleton(() => Login(loginRepository: sl()));

  //Blocs
  sl.registerFactory(() => AuthBloc(login: sl()));
}
