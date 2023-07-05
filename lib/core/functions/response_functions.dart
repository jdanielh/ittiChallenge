import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

import '../exceptions/api_excepcion.dart';
import '../models/wsexceptions/ws_return_error_model.dart';

void logInfo(String message) {
  developer.log(message, name: 'ChallengeITTi');
}

void responseLog(String type, String url, int statusCode, String response) {
  developer.log('$type ------> $url', name: 'ChallengeITTi');
  developer.log('Status -----> ${statusCode.toString()}',
      name: 'ChallengeITTi');
  developer.log('Response ---> $response', name: 'ChallengeITTi');
}

ApiExceptions wrapException(e) {
  logInfo('Exception --> ${e.toString()}');

  String message;
  if (e is SocketException) {
    message = '¿Podrías verificar tu conexión a internet?';
  } else if (e is TimeoutException) {
    message = 'No se pudo acceder al servicio ¿Conexión lenta?';
  } else if (e is Exception) {
    message = e.toString();
  } else if (e is WsErrorReturnModel) {
    message = e.message;
  } else {
    message = 'No se puede acceder al servicio. Intentelo más tarde.';
  }
  throw message;
}

dynamic handleResponse(http.Response response) {
  logInfo('Status ----> ${response.statusCode.toString()}');
  logInfo('Response --> ${(response.body.isEmpty ? '' : response.body)}');

  if (response.statusCode == 401) {
    ///TODO: Se elimina la sesión del usuario por respuesta del servicio con código [401]
  } else if (response.statusCode == 400 ||
      response.statusCode == 403 ||
      response.statusCode == 404) {
    WsErrorReturnModel exceptions =
        WsErrorReturnModel.fromJson(json.decode(response.body));
    throw exceptions.message.toString();
  }

  if (response.statusCode == 201 || response.statusCode == 202) {
    return {};
  } else if (response.statusCode == 200) {
    if (response.body.isEmpty) {
      return {};
    }

    return json.decode(response.body);
  } else if (response.statusCode == 503) {
    return json.decode(response.body);
  } else if (response.statusCode == 500) {
    throw 'Estamos experimentando demoras, por favor volvé a intentar en unos minutos o comunicate con nosotros.';
  } else {
    WsErrorReturnModel exception =
        WsErrorReturnModel.fromJson(json.decode(response.body));

    throw exception.message.toString();
  }
}
