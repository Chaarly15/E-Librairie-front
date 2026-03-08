class ApiException implements Exception {
  final String? message ;
  final String? code ;
  final String? url ;
  final String? prefix;

  ApiException([this.message, this.code, this.url, this.prefix]);
}

class FecthDataException extends ApiException {
  FecthDataException([String? message, String? code, String? url]):super(message, code, url);
}

class ApiNotRespondingException extends ApiException {
  ApiNotRespondingException([String? message, String? code, String? url]):super(message, code, url, 'Api not respond');
}