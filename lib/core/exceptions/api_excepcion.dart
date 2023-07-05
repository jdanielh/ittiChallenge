
import '../models/wsexceptions/ws_return_error_model.dart';
import 'exceptions.dart';


class ApiExceptions extends ApiServerException {
  final int statusCode;
  final String message;

  ApiExceptions._(this.statusCode, this.message) : super(message: message);

  ApiExceptions.unexpected(String message) : this._(500, message);

  ApiExceptions.remote(WsErrorReturnModel wsErrorReturnModel) : this._(
    wsErrorReturnModel.statusCode,
    wsErrorReturnModel.message,
  );

  ApiExceptions.response(int code, String message) : this._(code, message,);

  @override
  String toString() {
    return '{status: $statusCode, message: $message}';
  }
}