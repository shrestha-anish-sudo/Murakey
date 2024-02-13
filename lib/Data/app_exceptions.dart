class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? messages])
      : super(messages, 'Error during Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? messages]) : super(messages, 'Invalid Request');
}

class NotFoundException extends AppException {
  NotFoundException([String? messages])
      : super(messages, 'Resources not found');
}

class UnauthorizedExcpetion extends AppException {
  UnauthorizedExcpetion([String? messages])
      : super(messages, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? messages])
      : super(messages, 'Invalid Request');
}
