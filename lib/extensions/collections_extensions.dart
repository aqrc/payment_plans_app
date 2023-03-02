/// Dart's equivalent to Kotlin's let.
/// Convenient to chain with null check:
/// ```dart
/// final modifiedNullableValue = nullableValue.params.param1?.let((it) => modify(it));
/// ```
extension ObjectExt<T> on T {
  R let<R>(R Function(T) x) => x(this);
}