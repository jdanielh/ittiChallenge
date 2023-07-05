// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) {
  return UserRequestModel(
    login: json['login'],
    pass: json['pass'],
  );
}

Map<String, String> _$UserRequestModelToJson(UserRequestModel instance) => <String, String>{
  'login': instance.login ?? '',
  'pass': instance.pass ?? '',
};

