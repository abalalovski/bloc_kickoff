import 'package:bloc_kickoff/feature/data/feature_repository.dart';
import 'package:bloc_kickoff/feature/feature_event.dart';
import 'package:bloc_kickoff/feature/feature_state.dart';
import 'package:bloc_kickoff/feature/feature_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

// general feature bloc to resolve the state for feature page
class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  FeatureBloc() : super(Loading());

  final _featureRepository = FeatureRepository();

  @override
  Stream<FeatureState> mapEventToState(FeatureEvent event) {
    if (event is LoadTitle) {
      return Stream.value(const Success(FeatureViewModel(
        title: 'Title',
        subtitle: 'Subtitle',
      )));
    }

    if (event is StateWrapper) {
      return Stream.value(event.state);
    }

    if (event is UpdateTitle) {
      _featureRepository.updateTitle(event.newTitle).listen((_) {
        Logger().i('title saved successfully');

        // this call is not necessary, but because the health metrics are mocked
        // with a hardcoded Stream.value call, they lose the reactive nature
        // and looks like the use-case is not reactive. This is a workaround
        // to showcase the behavior
        add(LoadTitle());
      });
    }

    return const Stream.empty();
  }
}
