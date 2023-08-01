sealed class Result<S extends Object, F extends Object> {
  factory Result.success(S success) => Success<S, F>(success);
  factory Result.failure(F failure) => Failure<S, F>(failure);

  T fold<T>(
    T Function(S success) onSuccess,
    T Function(F failure) onFailure,
  );
}

class Success<S extends Object, F extends Object> implements Result<S, F> {
  final S _value;

  const Success(this._value);

  @override
  T fold<T>(
    T Function(S success) onSuccess,
    T Function(F failure) onFailure,
  ) {
    return onSuccess(_value);
  }
}

class Failure<S extends Object, F extends Object> implements Result<S, F> {
  final F _value;

  const Failure(this._value);

  @override
  T fold<T>(
    T Function(S success) onSuccess,
    T Function(F failure) onFailure,
  ) {
    return onFailure(_value);
  }
}

class Unit {
  const Unit._();
}

const unit = Unit._();

typedef AsyncResult<S extends Object, F extends Object> = Future<Result<S, F>>;
