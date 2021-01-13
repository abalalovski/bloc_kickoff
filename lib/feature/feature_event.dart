import 'package:bloc_kickoff/feature/feature_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class FeatureEvent extends Equatable {
  const FeatureEvent();

  @override
  List<Object> get props => [];
}

class LoadTitle extends FeatureEvent {}

class UpdateTitle extends FeatureEvent {
  const UpdateTitle({
    @required this.newTitle,
  })  : assert(newTitle != null),
        super();

  final String newTitle;

  @override
  List<Object> get props => [newTitle];
}

// wraps state so that it's emited towards the ui
// used as workaround to circumvent bloc's infinite stream
// overload
class StateWrapper extends FeatureEvent {
  const StateWrapper(
    this.state,
  )   : assert(state != null),
        super();

  final FeatureState state;

  @override
  List<Object> get props => [state];
}
