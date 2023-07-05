import 'package:itti_challenge_flutter/core/webservices/api/client.dart';

import '../models/user_request_model.dart';

abstract class AuthRemoteDataSources {
  /// LOGIN
  Future<dynamic> login(UserRequestModel userDatas);
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  final IttiChallengeRequestClient ittiChallengeClient;

  AuthRemoteDataSourcesImpl({
    required this.ittiChallengeClient,
  });

  @override
  Future<dynamic> login(UserRequestModel userDatas) async {
    final body = {
      "login": userDatas.login ?? '',
      "password": userDatas.pass ?? ''
    };
    return await ittiChallengeClient.postNoSession('/signin', body: body);
  }
}
