import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TopLevelView extends StatelessWidget {

   const TopLevelView({ super.key });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: MultiBlocProvider(
          providers: providers(),
          child: child(context)
      )
    );
  }

  Widget child(BuildContext context);

  List<BlocProvider> providers();
}