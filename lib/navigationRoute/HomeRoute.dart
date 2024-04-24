import 'package:flutter/material.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/scenario/home/currency/CurrencyView.dart';
import 'package:sampl/scenario/home/main/HomeView.dart';
import 'package:sampl/scenario/home/transaction/TransactionView.dart';
import 'package:sampl/util/design/color.dart';

class HomeRoute {
  static const String init = '/home';
  static const String currency = '/home/currency';
  static const String transaction = '/home/transaction';
}



WidgetBuilder? homeRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute.init:
      return (BuildContext context) => Container(
        color : colorWhite,
        child: const HomeView(),
      );
    case HomeRoute.transaction: {
      final args = settings.arguments as HomeRouteTransactionArgument;
      return (BuildContext context) =>  Container(
        color : colorWhite,
        child: TransactionView(transactionId : args.transactionId),
      );
    }
    case HomeRoute.currency:
      final args = settings.arguments as HomeRouteCurrencyArgument;
      return (BuildContext _) => Container(
        color : colorWhite,
        child: CurrencyView(symbol: args.currencySymbolEnum),
      );
    default:
      break;
  }
  return null;
}


class HomeRouteTransactionArgument  {
  final int transactionId;

  HomeRouteTransactionArgument({
    required this.transactionId
  });
}

class HomeRouteCurrencyArgument {
  final CurrencySymbol currencySymbolEnum;

  HomeRouteCurrencyArgument({
    required this.currencySymbolEnum
  });
}