class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, "Unauthorized: ");
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, "Error during communication: ");
}

class ServerError extends AppException {
  ServerError([message]) : super(message, "Server Error: ");
}
