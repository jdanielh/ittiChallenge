import 'package:equatable/equatable.dart';

part 'ws_return_error_model.g.dart';

class WsErrorReturnModel extends Equatable {
  final int statusCode;
  final String message;

  const WsErrorReturnModel({
    required this.statusCode,
    required this.message,
  });

  @override
  List<Object> get props => [statusCode, message];

  factory WsErrorReturnModel.fromJson(Map<String, dynamic> json) => _$WsErrorReturnModelFromJson(json);

  Map<String, dynamic> toJson() => _$WsErrorReturnModelToJson(this);
}
