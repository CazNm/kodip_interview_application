import 'package:flutter/material.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';
import 'package:sampl/navigationRoute/SplashRoute.dart';
import 'package:sampl/scenario/home/HomeNavigator.dart';
import 'package:sampl/scenario/splash/SplahView.dart';
import 'package:sampl/scenario/splash/SplashScreen.dart';

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
      routes: <String, WidgetBuilder> {
          SplashRoute.init :(BuildContext context) => const SplashView(),
          HomeRoute.init : (BuildContext context) => const HomeNavigator()
        }
    );
  }
}