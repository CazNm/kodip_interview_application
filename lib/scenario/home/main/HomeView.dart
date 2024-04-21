import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:sampl/scenario/home/main/HomeScreen.dart';
import 'package:sampl/scenario/home/main/bloc/HomeBloc.dart';
import 'package:sampl/util/ui/TopLevelView.dart';

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