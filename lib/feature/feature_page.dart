import 'package:bloc_kickoff/common/color_palette.dart';
import 'package:bloc_kickoff/common/no_content_widget.dart';
import 'package:bloc_kickoff/feature/feature_bloc.dart';
import 'package:bloc_kickoff/feature/feature_bottom_sheet_widget.dart';
import 'package:bloc_kickoff/feature/feature_event.dart';
import 'package:bloc_kickoff/feature/feature_state.dart';
import 'package:bloc_kickoff/feature/feature_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

const _appBarElevation = 0.0;
const _pageTitle = 'A Cool Feature';
const _pageTitleTextSize = 32.0;

class FeaturePage extends StatefulWidget {
  const FeaturePage({Key key}) : super(key: key);

  @override
  _FeaturePageState createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  @override
  void initState() {
    super.initState();
    context.read<FeatureBloc>().add(LoadTitle());
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<FeatureBloc, FeatureState>(
      builder: (context, featureState) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                _pageTitle,
                style: GoogleFonts.sourceSansPro(
                  color: ColorPalette.of(context).black,
                ),
              ),
              elevation: _appBarElevation,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: ColorPalette.of(context).darkGreen,
              ),
            ),
            body: _renderViewState(featureState),
          ));

  // a helper method to make rendering of states more clear
  // in general I avoid using methods to create Widgets but
  // for the reason of the task I did it like this
  Widget _renderViewState(FeatureState featureState) {
    if (featureState is Loading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            ColorPalette.of(context).orange,
          ),
        ),
      );
    } else {
      if (featureState is Success) {
        return _FeatureMainBodyWidget(
          key: const ValueKey('feature success widget'),
          viewModel: featureState.viewModel,
        );
      } else {
        return const NoContentWidget(
          icon: Icons.error,
          title: 'Error while showing feature page',
        );
      }
    }
  }
}

class _FeatureMainBodyWidget extends StatelessWidget {
  const _FeatureMainBodyWidget({
    @required this.viewModel,
    Key key,
  })  : assert(viewModel != null),
        super(key: key);

  final FeatureViewModel viewModel;

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              viewModel.title,
              style: GoogleFonts.sourceSansPro(
                fontSize: _pageTitleTextSize,
                fontWeight: FontWeight.bold,
                color: ColorPalette.of(context).darkGreen,
              ),
            ),
          )));

  Future<void> _showFeatureBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (context) => const FeatureBottomSheetWidget());

    if (result != null) {
      context.read<FeatureBloc>().add(
            UpdateTitle(newTitle: result),
          );
    }
  }
}
