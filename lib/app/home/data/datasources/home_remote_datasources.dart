import 'package:itti_challenge_flutter/core/webservices/api/client.dart';

abstract class HomeRemoteDataSources {
  Future<dynamic> homeList();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  final IttiChallengeRequestClient ittiChallengeClient;

  HomeRemoteDataSourcesImpl({
    required this.ittiChallengeClient,
  });

  @override
  Future<dynamic> homeList() async {
    return await ittiChallengeClient.get('/users');
  }
}
