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

  @override
  Stream<void> updateTitle(String title) => _dataSource.save(title).asStream();
}
