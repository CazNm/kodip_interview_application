import 'package:flutter/material.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';
import 'package:sampl/scenario/home/main/HomeView.dart';
import 'package:sampl/util/debugPrint.dart';
import 'package:sampl/util/design/color.dart';
import 'package:sampl/util/design/textClass.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: HomeRoute.homeMain,
      onGenerateRoute: (RouteSettings settings) {
        printHelper("navigation route ${settings.name}");
        WidgetBuilder builder;
        switch (settings.name) {
          case HomeRoute.homeMain:
            builder = (BuildContext context) => Container(
              color : colorWhite,
              child: const HomeView(),
            );
          case HomeRoute.transaction:
            builder = (BuildContext context) =>  Container(
              color : colorWhite,
              child: const TextTitleLarge(text: "home / transaction"),
            );
          case HomeRoute.currency:
            builder = (BuildContext _) => Container(
              color : colorWhite,
              child: const TextTitleLarge(text: "home / currency"),
            );
          default:
            builder = (BuildContext _) => Container(
              color : colorWhite,
              child: const TextTitleLarge(text: ""),
            );
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}