import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/scenario/splash/SplashScreen.dart';
import 'package:sampl/scenario/splash/bloc/SplashBLoC.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => SplashBloc())
        ],
        child: const SplashScreen()
    );
  }
}
