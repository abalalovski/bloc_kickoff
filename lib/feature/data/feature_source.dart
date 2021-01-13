// abstraction of a feature data source
import 'package:bloc_kickoff/common/source.dart';

class FeatureSource implements Source<String> {
  @override
  Future<String> retrieve() => Future.value('Title');

  @override
  // no op
  Future<void> save(String item) => Future.value();
}
