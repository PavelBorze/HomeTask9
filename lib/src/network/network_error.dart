class NetworkError {
  final int code;
  final String message;

  NetworkError(this.code, this.message);

  @override
  String toString() {
    return 'NetworkError(code: $code, message: $message)';
  }
}