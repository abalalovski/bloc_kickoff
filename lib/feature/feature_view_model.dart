import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
@immutable
class FeatureViewModel extends Equatable {
  const FeatureViewModel({
    @required this.title,
    @required this.subtitle,
  })  : assert(title != null),
        assert(subtitle != null),
        super();

  final String title;
  final String subtitle;

  @override
  List<Object> get props => [
        title,
        subtitle,
      ];
}
