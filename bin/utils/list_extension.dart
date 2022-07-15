extension ListExtension<E> on List<E> {
  E? firstWhereOrNull (bool Function(E element) function) {
    for (E element in this) {
      if (function(element)) return element;
    }
    return null;
  }
}