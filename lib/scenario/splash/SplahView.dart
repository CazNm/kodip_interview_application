import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/scenario/splash/SplashScreen.dart';
import 'package:sampl/scenario/splash/bloc/SplashBLoC.dart';
import 'package:sampl/util/customClass/TopLevelView.dart';


class SplashView extends TopLevelView {
  const SplashView({super.key});

  @override
  Widget child(BuildContext context) {
    // TODO: implement child
    return const SplashScreen();
  }

  @override
  List<BlocProvider<SplashBloc>> providers() {
    return [ BlocProvider(create: (BuildContext context) => SplashBloc()) ];
  }

}
