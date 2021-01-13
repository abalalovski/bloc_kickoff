// data source abstraction class
// can be implemented by any source that has retrieval or saving features
abstract class Source<T> {
  Future<T> retrieve();

  void save(T item);
}
