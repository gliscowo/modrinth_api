import 'errors.dart';

sealed class Result<V, E> {
  const factory Result.ok(V value) = Ok._;
  const factory Result.error(E error) = Error._;
  const Result();

  V unwrap();
  bool get isOk;
  bool get isError => !isOk;
}

final class Ok<V, E> extends Result<V, E> {
  final V value;
  const Ok._(this.value);

  @override
  bool get isOk => true;

  @override
  V unwrap() => value;
}

final class Error<V, E> extends Result<V, E> {
  final E error;
  const Error._(this.error);

  @override
  bool get isOk => false;

  @override
  V unwrap() => throw UnsupportedError("unwrap() called on error");
}

extension Results<T, E extends RequestException> on Future<T> {
  Future<Result<T, E>> get result async {
    try {
      return Result.ok(await this);
    } on RequestException catch (e) {
      return Result.error(e as E);
    }
  }
}
