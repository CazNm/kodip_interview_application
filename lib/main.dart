import 'package:flutter/material.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';
import 'package:sampl/navigationRoute/SplashRoute.dart';
import 'package:sampl/scenario/splash/SplahView.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Pretendard'
      ),
      initialRoute: SplashRoute.init,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder? builder;

        builder ??= switch(settings.name) {
            SplashRoute.init => (BuildContext context) => const SplashView(),
            String() => null,
            null => null,
          };

        builder ??= homeRoute(settings);

        if(settings.name == "/") {
          builder = (BuildContext context) => const SizedBox();
        }

        if(builder == null) {
          throw Exception("Navigator builder must not be null ${settings.name}");
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}