final class RatelimitExceededException implements Exception {
  final DateTime resetAfter;
  RatelimitExceededException(int resetsAt) : resetAfter = DateTime.fromMillisecondsSinceEpoch(resetsAt);

  @override
  String toString() => "API Rate limit exceeded, resets at ${resetAfter.toString()}";
}

abstract base class RequestException implements Exception {
  final int code;
  const RequestException(this.code);
}

final class InvalidApiResponseException extends RequestException {
  final Set<int> expected;
  final String responseBody;
  const InvalidApiResponseException(super.code, this.expected, this.responseBody);

  @override
  String toString() => "Expected response to be any of ${expected.join(", ")}, API returned $code.\n$responseBody";
}

final class NoSuchResourceException extends RequestException {
  const NoSuchResourceException() : super(404);
}

final class ModrinthException extends RequestException {
  final String error, description;
  const ModrinthException(super.code, this.error, this.description);

  @override
  String toString() => (StringBuffer()
        ..writeln("Modrinth Error ($code): $error")
        ..writeln(description))
      .toString();
}
