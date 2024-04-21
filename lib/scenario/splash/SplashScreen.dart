
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';
import 'package:sampl/scenario/splash/bloc/SplashBLoC.dart';
import 'package:sampl/scenario/splash/bloc/uiState/splashUiState.dart';
import 'package:sampl/util/debugPrint.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }

}

class _SplashScreenState extends State<SplashScreen> {

  late SplashBloc splashBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashBloc = BlocProvider.of<SplashBloc>(context);
    SplashUiState state = splashBloc.state;

    printHelper(state.toString());
    switch(state.splashState) {
      case SplashStateInitialize():
        splashBloc.add(SplashInitialize());
      default :
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<SplashBloc, SplashUiState>(
        listener: (context, state) {
          printHelper(state.toString());
          switch(state.splashState) {
            case SplashStateCheckPermission():
              return;
            case SplashStateLogin() :
              return;
            case SplashStateSuccessful():
              Navigator.of(context).pushReplacementNamed(HomeRoute.init);
              return;
            case SplashStateError():
              return;
            default :
              break;
          }
        },
        builder: (BuildContext context, state) {
          return Container(
            alignment: Alignment.center,
            child: LinearProgressIndicator(
                backgroundColor: Colors.amber,
                color: Colors.blue,
                value : state.loadingStage.toDouble() / 100
            ),
          );
        }
    );
  }

}