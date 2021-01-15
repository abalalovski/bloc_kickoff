import 'package:bloc_kickoff/feature/data/feature_source.dart';

// abstraction repository,
// mainly used for convenient mocking during testing
abstract class AbsRepository {
  Stream<String> getTitle();

  Stream<void> updateTitle(String title);
}

// repository that provides information for feature's data,
class FeatureRepository implements AbsRepository {
  final _dataSource = FeatureSource();

  @override
  Stream<String> getTitle() => _dataSource.retrieve().asStream();

  final arr1 = [1, 2, 3, 4];
  final arr2 = [3, 4, 5, 6];

  @override
  Stream<void> updateTitle(String title) {
    return _dataSource.save(title).asStream();
  }

  bool function(List<int> arr1, List<int> arr2) =>
      arr1.any((element) => arr2.contains(element));
}
