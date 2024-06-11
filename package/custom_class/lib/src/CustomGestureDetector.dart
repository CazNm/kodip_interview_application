import 'package:flutter/gestures.dart';

import 'util/debugPrint.dart';

class CustomGestureTapDetector extends OneSequenceGestureRecognizer {
  final Function onPanDown;
  final void Function(Offset delta , CustomGesture? gesture) onPanUpdate;
  final void Function(bool gestureUpdated) onPanEnd;

  /**
   * offset 은 position value 이다.
   */
  final Map<int, Offset> _currentPointerList = {};

  double lastPointersDistance = 0;
  double currentPointersDistance = 0;

  var _updated = false;
  CustomGestureTapDetector({
    required this.onPanDown,
    required this.onPanEnd,
    required this.onPanUpdate
  });

  @override
  // TODO: implement debugDescription
  String get debugDescription => "csGTD";


  @override
  void addPointer(PointerEvent event) {
    _updated = false;
    if(event is PointerDownEvent) {
      startTrackingPointer(event.pointer);
      resolve(GestureDisposition.accepted);
      onPanDown(event.position);
      _currentPointerList[event.pointer] = event.delta;
    } else {
      stopTrackingPointer(event.pointer);
    }

  }


  @override
  void didStopTrackingLastPointer(int pointer) {
    printHelper("stop tracking id $pointer");

  }

  @override
  void handleEvent(PointerEvent event) {
    printHelper("pointer Helper event ${event.delta} \npointer : ${event.pointer}");

    if (event is PointerMoveEvent) {
      _updated = true;

      CustomGesture? gesture;
      /**
       * logic decide zoom in and out
       */
      if(_currentPointerList.length == 2) {
        /**
         * 만약 첫번째 포인터가 업데이트 될 경우.
         * 마지막 두번째 포인터의 거리와 첫번째 포인터 거리가 줄어들면 축소 멀어지면 확대이다.
         *
         * 여기서는 이전 포인터들의 거리를 잰다.
         */

        var list = _currentPointerList.entries.toList();
        if(list.first.key == event.pointer) {
          lastPointersDistance = (list.first.value - list.last.value).distance;
          _currentPointerList[event.pointer] = event.position;
        }
        /**
         * 여기서는 현재 포인터들의 거리를 잰 후 확대와 축소 여부를 나눈다.
         */
        if(_currentPointerList.entries.toList().last.key == event.pointer) {
          _currentPointerList[event.pointer] = event.position;
          currentPointersDistance = (list.first.value - list.last.value).distance;
          gesture = currentPointersDistance > lastPointersDistance ?
                        Zoom(
                          positive: true,
                          zoomScale: lastPointersDistance - currentPointersDistance
                        )
                        :
                        Zoom(
                          positive: false,
                          zoomScale: lastPointersDistance - currentPointersDistance
                        );
        }

      } else if (_currentPointerList.length == 1) {
        /**
         * 여기서는 delta value 로 드래그의 좌우 방향만을 확인한다.
         */
        gesture = HorizontalDrag(positive: event.delta.dx > 0 ? true : false);
      }

      onPanUpdate(event.delta, gesture);
    }

    if (event is PointerUpEvent) {
      onPanEnd(_updated);
      if(_currentPointerList.length != 2) _updated = false;
      removePointerFromList(event.pointer);
      stopTrackingPointer(event.pointer);
    }
  }

  void removePointerFromList(int pointer) {
    if(_currentPointerList.containsKey(pointer)) {
      _currentPointerList.remove(pointer);
    }
  }

  Offset getOffsetDelta(Offset old, Offset latest) {
    return Offset(latest.dx - old.dx , latest.dy - old.dy);
  }
}

sealed class CustomGesture {}

class Zoom extends CustomGesture {
  final bool positive;
  final double zoomScale;

  Zoom({
    required this.positive,
    required this.zoomScale
  });
}

class HorizontalDrag extends CustomGesture {
  final bool positive;

  HorizontalDrag({
    required this.positive
  });

}
