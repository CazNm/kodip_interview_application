import 'dart:ui';
import 'package:flutter/material.dart';

/// gray s -> lightTheme
var colorEEEEEE =  (BuildContext context) {
  final ThemeData data = Theme.of(context);
  return  data.brightness == Brightness.light ? const Color(0xFFEEEEEE) : color999999;
};
/// gray m -> darkTheme
var color999999 = const Color(0xFF999999);
/// gray l -> DarkTheme Background
var color444444 = const Color(0xFF444444);

var color50444444 = const Color(0x50444444);

/// green s -> darkTheme
var colorC6FF6A = const Color(0xFFC6FF6A);
/// green m -> lightTheme
var color88BE2E = (BuildContext context) {
  final ThemeData data = Theme.of(context);
  return  data.brightness == Brightness.light ? const Color(0xFF88BE2E) : colorC6FF6A;
};
/// green l
var color436D00 = const Color(0xFF436D00);

var colorBFFC49 =  const Color(0xFFBFFC49);

/// red s -> dartkTheme
var colorFF5E3B = const Color(0xFFFF5E3B);
/// red m -> lightTheme
var colorBE3214 = (BuildContext context) {
  final ThemeData data = Theme.of(context);
  return  data.brightness == Brightness.light ? const Color(0xFFBE3214) : colorFF5E3B;
};
/// red l
var color741500 = const Color(0xFF741500);

///yellow s -> dark theme
var colorFFF737 = const Color(0xFFFFF737);
///yellow m -> light Theme
var colorC9C211 = (BuildContext context) {
  final ThemeData data = Theme.of(context);
  return  data.brightness == Brightness.light ? const Color(0xFFC9C211) : colorFFF737;
};
///yellow L
var color837E00 = const Color(0xFF837E00);

///LightTheme background
var colorWhite = (BuildContext context) {
  final ThemeData data = Theme.of(context);
  return  data.brightness == Brightness.light ? const Color(0xFFFFFFFF) : color444444;
};

var colorBlack = (BuildContext context) {
  final ThemeData data = Theme.of(context);
  return  data.brightness == Brightness.light ? const Color(0xFF000000) : color999999;
};
