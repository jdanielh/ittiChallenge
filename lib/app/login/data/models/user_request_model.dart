import 'package:json_annotation/json_annotation.dart';

part 'user_request_model.g.dart';

@JsonSerializable()
class UserRequestModel {
  late final String? login;
  late final String? pass;

  UserRequestModel({
    this.login,
    this.pass,
  });

  factory UserRequestModel.fromJson(Map<String, dynamic> json) => _$UserRequestModelFromJson(json);

  Map<String, String> toJson() => _$UserRequestModelToJson(this);

}