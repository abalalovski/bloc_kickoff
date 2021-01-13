import 'package:bloc_kickoff/feature/feature_view_model.dart';
import 'package:equatable/equatable.dart';

class FeatureState extends Equatable {
  const FeatureState();

  @override
  List<Object> get props => [];
}

// success state
class Success extends FeatureState {
  const Success(
    this.viewModel,
  );

  final FeatureViewModel viewModel;
}

// loading state for feature page
class Loading extends FeatureState {}

// error state
class Error extends FeatureState {}
