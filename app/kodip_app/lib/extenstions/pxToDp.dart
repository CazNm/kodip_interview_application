import 'package:flutter/cupertino.dart';

extension PxToDp on double {
  double convertFromPixel(context){
    var size = MediaQuery.of(context).devicePixelRatio; //3.5
    var value = this / size; //3.5dp = 1px
    return value;
  }
}