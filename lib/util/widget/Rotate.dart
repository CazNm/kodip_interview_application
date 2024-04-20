import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class Rotate extends StatelessWidget {

  final Widget child;
  final double degree;

  const Rotate({
    super.key,
    this.degree = 0,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: degree * math.pi / 180,
      child: child
    );
  }
}