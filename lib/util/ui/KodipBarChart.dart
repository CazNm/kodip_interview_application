import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sampl/util/customClass/CustomGestureDetector.dart';
import 'package:sampl/util/debugPrint.dart';
import 'package:sampl/util/design/color.dart';
import 'package:sampl/util/design/fixedSize.dart';
import 'package:sampl/util/design/paddingValue.dart';
import 'package:sampl/util/design/textClass.dart';


class KodipBarChart extends StatefulWidget {
  final Map<String,double> mapDataForChart;

  const KodipBarChart({
    super.key,
    required this.mapDataForChart
  });
  @override
  State<StatefulWidget> createState() {
    return _KodipBarChart();
  }

}

class _KodipBarChart extends State<KodipBarChart> {

  late List<int> epochList;
  static const minListSize = 3;
  static const defaultListSize = 5;
  static const maxListSize = 10;
  static const minScaleLevel = 1.2;
  static const defaultScaleLevel = 1.6;
  static const maxScaleLevel = 2.0;

  var groupSpaceList = [
    size120,
    size60,
    size48,
    size24,
    size16,
    size16,
    size16,
    size16
  ];

  double maxValueOfY = 0;

  double currentScaleLevel = defaultScaleLevel;
  int currentListSize = 5;
  int renderListPosition = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    epochList = widget.mapDataForChart.keys.map((e) => int.parse(e)).toList();
  }

  void onTap() {
    printHelper("mapdata length is onTap reset ${widget.mapDataForChart.length}");
    setState(() {
      currentListSize = defaultListSize;
      currentScaleLevel = defaultScaleLevel;
      renderListPosition = 0;
    });
  }

  void onHorizontalDrag(Offset delta, bool isPositive) {
    setState(() {
      var primDelta = delta.distance;
      printHelper("prim delta value is $primDelta");
      if (delta.dx.isNegative) {
        if(renderListPosition + currentListSize < widget.mapDataForChart.length - 1 && primDelta > 1.3) renderListPosition++;
      } else {
        if(renderListPosition > 0 && primDelta > 1.3) renderListPosition--;
      }
    });
  }

  void onZoom(Zoom zoomData) {
    setState(() {
      var absoluteZoomScale = zoomData.zoomScale.abs();
      printHelper("zoom scale value is ${absoluteZoomScale}");
      /**
       * positive 는 확대 이므로 확대는
       *
       * 최대 값의 크기가 줄어야 하고
       *
       * 막대의 개수가 줄어야 합니다.
       */
      if(absoluteZoomScale > 1.4) {
        if(zoomData.positive) {
          if(currentListSize > minListSize) {
            currentListSize--;
          }

          if(currentScaleLevel > minScaleLevel) {
            currentScaleLevel = currentScaleLevel - 0.1;
          }
        } else {
          if(currentListSize < maxListSize) {
            currentListSize++;
          }

          if(currentScaleLevel < maxScaleLevel) {
            currentScaleLevel = currentScaleLevel + 0.1;
          }
        }
      }
    });
  }

  bool _onPanDown(Offset details) {
    printHelper("drag detail down $details");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          CustomGestureTapDetector : GestureRecognizerFactoryWithHandlers<CustomGestureTapDetector>(() =>
            CustomGestureTapDetector(
                onPanDown: _onPanDown,
                onPanEnd: (gestureUpdated) {
                  if(!gestureUpdated) {
                    onTap();
                  }
                },
                onPanUpdate: (deltaOffset, customGesture) {
                  printHelper("delta is $deltaOffset / type ${customGesture.runtimeType}");
                  if(customGesture is HorizontalDrag) {
                    onHorizontalDrag(deltaOffset, customGesture.positive);
                  } else if(customGesture is Zoom) {
                    onZoom(customGesture);
                  }
                }
            ),
            (CustomGestureTapDetector instance){}
          )
        },
        child: BarChart(setRenderGroup())
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
            color: color88BE2E(context),
            width: 20,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(5))
        )
      ],
    );
  }

  Widget bottomDate(
      double index,
      TitleMeta meta
  ) {
    var dt = DateTime.fromMillisecondsSinceEpoch(epochList[renderListPosition + index.toInt()]);
    var date = DateFormat('MM/dd/yyyy').format(dt);
    return  SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        angle: 20,
        fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
        child: TextTitleSmall(text : date)
    );
  }

  BarChartData setRenderGroup() {
    var list = widget.mapDataForChart.entries.toList().getRange(renderListPosition, renderListPosition + currentListSize).toList();
    var indexOfList = 0;

    List<BarChartGroupData> listToRender = List.empty(growable: true);
    for (var value in list) {
      listToRender.add(generateBar(indexOfList, value.value));
      indexOfList++;
    }

    for (var element in list) {
      maxValueOfY = element.value > maxValueOfY ?  element.value  :  maxValueOfY;
    }

    return BarChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (index, meta){
                return  SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: TextTitleMedium(text : "${index.round()}")
                );
              },
              reservedSize: size48.toDouble(),
              interval: maxValueOfY * 1.6 / 4
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomDate,
              reservedSize: 80,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: maxValueOfY * 1.6 / 4,
          getDrawingHorizontalLine: (value) => FlLine(
            color: color999999,
            strokeWidth: 1,
          ),
          drawVerticalLine: false,
          checkToShowHorizontalLine: (value) {
            return true;
          },
        ),
        maxY: maxValueOfY * currentScaleLevel,
        alignment: BarChartAlignment.center,
        groupsSpace: groupSpaceList[currentListSize - 3].toDouble(),
        barGroups: listToRender
    );
  }
}
