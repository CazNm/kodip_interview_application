import 'package:custom_class/custom_class.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/scenario/home/currency/CurrencyScreen.dart';
import 'package:sampl/scenario/home/currency/bloc/CurrencyBloc.dart';

class CurrencyView extends TopLevelView {
  final CurrencySymbol symbol;

  const CurrencyView({
    super.key,
    required this.symbol
  });

  @override
  Widget child(BuildContext context) {
    // TODO: implement child
    return CurrencyScreen(
      symbol : symbol
    );
  }

  @override
  List<BlocProvider<CurrencyBloc>> providers() {
    return [BlocProvider(create: (BuildContext context) => CurrencyBloc())];
  }
}