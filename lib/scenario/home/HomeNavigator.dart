import 'package:flutter/material.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: HomeRoute.homeMain,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case HomeRoute.homeMain:
            builder = (BuildContext context) => Container();
          case HomeRoute.transaction:
            builder = (BuildContext context) =>  Container();
          case HomeRoute.currency:
            builder = (BuildContext _) => Container();
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}