class OperationResult<S, E> {
  final S? _result;
  final E? _error;

  OperationResult.success(S result) : _result = result, _error = null;
  OperationResult.error(E error) : _result = null, _error = error;

  bool get isSuccessful => _error == null;

  S get result => _result!;
  E get error => _error!;
}