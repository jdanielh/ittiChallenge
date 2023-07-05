import 'dart:convert';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:itti_challenge_flutter/core/functions/response_functions.dart';
import 'package:itti_challenge_flutter/core/webservices/api/enviroments.dart';

abstract class IttiChallengeRequestClient {
  Future<dynamic> get(String url);

  Future<dynamic> postNoBody(String url);

  Future<dynamic> post(String url, {required Map<String, dynamic> body});

  Future<dynamic> postNoSession(String url,
      {required Map<String, String> body});
}

class IttiChallengeRequestClientImpl extends IttiChallengeRequestClient {
  Environments env;
  final http.Client client;

  IttiChallengeRequestClientImpl({
    required this.env,
    required this.client,
  });

  String get baseUrl => Environments.API_BASE_URL;
  final box = GetStorage();

  @override
  Future<dynamic> get(String url) async {
    try {
      Map<String, String> header = <String, String>{};
      var urlLink = Uri.parse(baseUrl + url);
      // logInfo('GET ---> ${urlLink.toString()}');

      header.addAll(env.headerNoAuth);
      header['Authorization'] = 'Bearer ${box.read('authentication')}';

      final http.Response response = await client.get(urlLink, headers: header);

      // print(response.body);

      return handleResponse(response);
    } on Exception catch (e) {
      throw wrapException(e);
    }
  }

  @override
  Future<dynamic> postNoBody(String url) async {
    try {
      Map<String, String> header = <String, String>{};
      var urlLink = Uri.parse(baseUrl + url);
      // logInfo('POST ---> ${urlLink.toString()}');

      header.addAll(env.headerNoAuth);
      header['Authorization'] = 'Bearer ${box.read('authentication')}';

      final http.Response response =
          await client.post(urlLink, headers: header);

      return handleResponse(response);
    } on Exception catch (e) {
      throw wrapException(e);
    }
  }

  @override
  Future<dynamic> post(String url, {required Map<String, dynamic> body}) async {
    try {
      Map<String, String> header = <String, String>{};
      var urlLink = Uri.parse(baseUrl + url);
      // logInfo('POST ---> ${urlLink.toString()}');
      // logInfo('BODY ---> ${body.toString()}');

      header.addAll(env.headerNoAuth);
      header['Authorization'] = 'Bearer ${box.read('authentication')}';

      final http.Response response =
          await client.post(urlLink, headers: header, body: json.encode(body));

      return handleResponse(response);
    } on Exception catch (e) {
      throw wrapException(e);
    }
  }

  @override
  Future<dynamic> postNoSession(String url,
      {required Map<String, String> body}) async {
    try {
      var urlLink = Uri.parse(baseUrl + url);
      // print("BODY ---> ${body.toString()}");
      // print('Post No Session ---> ${urlLink.toString()}');

      Map<String, String> headers = env.headerNoAuth;

      // print("headers ${headers.toString()}");

      final http.Response response =
          await client.post(urlLink, headers: headers, body: json.encode(body));

      print(response.body);

      return handleResponse(response);
    } on Exception catch (e) {
      throw wrapException(e);
    }
  }
}
