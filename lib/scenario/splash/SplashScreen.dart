
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';
import 'package:sampl/scenario/splash/bloc/SplashBLoC.dart';
import 'package:sampl/scenario/splash/bloc/uiState/splashUiState.dart';
import 'package:sampl/util/debugPrint.dart';
import 'package:sampl/util/design/color.dart';
import 'package:sampl/util/toast/toastHelper.dart';

import '../../util/design/fixedSize.dart';

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
              splashBloc.add(SplashPermissionCheck());
              return;
            case SplashStateLogin() :
              splashBloc.add(SplashLoginAPI());
              return;
            case SplashStateSuccessful():
              Future.delayed(const Duration(milliseconds: 1000),(){
                Navigator.of(context).pushReplacementNamed(HomeRoute.init);
              });
              return;
            case SplashStateError():
              splashBloc.add(SplashOnError());
              var errorState = state.splashState as SplashStateError;
              showToast(context, msg: "에러가 발생했습니다. 잠시 후 앱이 종료 됩니다.\n원인 : ${errorState.errorReason.name}");
              Future.delayed(const Duration(milliseconds: 5000),(){
                SystemNavigator.pop();
              });
              return;
            default :
              break;
          }
        },
        builder: (BuildContext context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            color: colorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(flex: 1),
                _kodipPng(),
                const Spacer(flex: 1),
                LinearProgressIndicator(
                    backgroundColor: color444444,
                    color: color88BE2E,
                    value : state.loadingStage.toDouble() / 100
                ),
              ],
            )
          );
        }
    );
  }

  Widget _kodipPng() {
    const String kodipPngPath = "assets/image/kodipCircle.png";

    Widget kodipPngIcon = SizedBox(
      width: size90.toDouble(),
      height: size90.toDouble(),
      child: Image.asset(
          kodipPngPath,
          width: size90.toDouble(),
          height: size90.toDouble(),
      )
    );

    return kodipPngIcon;
  }

}