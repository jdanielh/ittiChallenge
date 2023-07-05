// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_return_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WsErrorReturnModel _$WsErrorReturnModelFromJson(Map<String, dynamic> json) {
  return WsErrorReturnModel(
    statusCode: json.containsKey('code') ? json['code'] as int : json.containsKey('codigo') ? json['codigo'] as int : json['code'],
    message: json.containsKey('message') ? json['message'].toString() : json.containsKey('msg') ? json['msg'].toString() : json['message'],
  );
}

Map<String, dynamic> _$WsErrorReturnModelToJson(WsErrorReturnModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
