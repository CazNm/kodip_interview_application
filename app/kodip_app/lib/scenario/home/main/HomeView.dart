import 'package:custom_class/custom_class.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:sampl/scenario/home/main/HomeScreen.dart';
import 'package:sampl/scenario/home/main/bloc/HomeBloc.dart';

class HomeView extends TopLevelView {
  const HomeView({super.key});

  @override
  Widget child(BuildContext context) {
    return const HomeScreen();
  }

  @override
  List<BlocProvider<HomeBloc>> providers() {
   return [BlocProvider(create: (BuildContext context) => HomeBloc())];
  }
}