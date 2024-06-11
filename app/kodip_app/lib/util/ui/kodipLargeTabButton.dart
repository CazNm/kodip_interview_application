import 'package:flutter/material.dart';
import 'package:sampl/util/design/color.dart';
import 'package:sampl/util/design/fixedSize.dart';
import 'package:sampl/util/design/paddingValue.dart';
import 'package:sampl/util/design/textClass.dart';

Widget kodipLargeTabButton(
    String buttonText,
    {
      bool showButton = true,
      required void Function() onClick
    }
) {
  if(showButton) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(paddingMedium.toDouble()),
        child: Container(
          width: double.infinity,
          height: size60.toDouble(),
          decoration: BoxDecoration(
              color: colorBFFC49,
              borderRadius: BorderRadius.all(Radius.circular(size8.toDouble()))
          ),
          child: Center(
            child: TextTitleSmall(text: buttonText),
          ),
        ),
      ),
    );
  } else {
    return Container();
  }
}