
extension ListExtension<E> on List<E>{
  List<T> mapIndexed<T>(T Function(E element, int index) mapper){
    final list = <T>[];
    for(int i = 0; i < length; i++){
      list.add(mapper(this[i],i));
    }
    return list;
  }
}