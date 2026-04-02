
extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) predicate) {
    try {
      return firstWhere(predicate);
    } catch (_) {
      return null;
    }
  }
}