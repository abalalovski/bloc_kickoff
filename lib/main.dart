import 'package:bloc_kickoff/feature/feature_bloc.dart';
import 'package:bloc_kickoff/feature/feature_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => FeatureBloc(),
        child: MaterialApp(
          title: 'Bloc kickoff project demo',
          theme: mainAppTheme,
          home: const FeaturePage(),
        ),
      );
}

final mainAppTheme = ThemeData(
    // no-op
    );
