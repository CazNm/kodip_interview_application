extension ListMapper<T> on List<T> {
  List<R> onMap<R>(
      R Function(T) changeItem
  ) {
    List<R> newList = List.empty(growable: true);
    for(var item in this) {
      newList.add(changeItem(item));
    }

    return newList;
  }
}