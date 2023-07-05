class ApiServerException implements Exception {
  final String? message;

  ApiServerException({
    this.message,
  });
}