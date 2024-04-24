import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/scenario/home/currency/bloc/CurrencyBloc.dart';
import 'package:sampl/scenario/home/currency/bloc/uiState/CurrencyUiState.dart';
import 'package:sampl/util/design/color.dart';
import 'package:sampl/util/design/fixedSize.dart';
import 'package:sampl/util/design/paddingValue.dart';
import 'package:sampl/util/design/textClass.dart';

import '../../../util/ui/KodipBarChart.dart';
import '../../../util/ui/kodipLargeTabButton.dart';
import 'package:fl_chart/fl_chart.dart';

class CurrencyScreen extends StatefulWidget {
  final CurrencySymbol symbol;

  const CurrencyScreen({
    super.key,
    required this.symbol
  });

  @override
  State<StatefulWidget> createState() {
    return _CurrencyScreen();
  }
}

class _CurrencyScreen extends State<CurrencyScreen> {
  late CurrencySymbol symbol;
  late CurrencyBloc currencyBloc;
  var index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    symbol = widget.symbol;
    currencyBloc = BlocProvider.of<CurrencyBloc>(context);
    currencyBloc.add(CurrencyInitializeEvent(symbol: symbol));
  }

  void onClickButtonToClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocConsumer<CurrencyBloc, CurrencyUiState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              color: colorWhite,
              child: Column(
                children: [
                  SizedBox(
                      height : MediaQuery.of(context).viewPadding.top
                  ),
                  SizedBox(
                    height: size36.toDouble(),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(paddingMedium.toDouble()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitleLarge(text: symbol.name),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size36.toDouble(),
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(paddingMedium.toDouble()),
                        child: state.currencyMap != null ? KodipBarChart(mapDataForChart: state.currencyMap!.currencyMap) : const SizedBox()
                    ),
                  ),
                  SizedBox(
                    height: size36.toDouble(),
                  ),
                  kodipLargeTabButton("닫기", onClick: onClickButtonToClose)

                ],
              )
          );
        }
    );


  }

  BarChartGroupData generateBar(
      int x,
      double currencyData
  ) {
    return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: currencyData,
            color: color88BE2E,
            width: 5
          )
        ],
    );
  }

  Widget bottomDate(
      int epochTime,
      TitleMeta meta
  ) {
    return  SideTitleWidget(
        axisSide: meta.axisSide,
        child: TextTitleLarge(text : epochTime.toString())
    );
  }
}