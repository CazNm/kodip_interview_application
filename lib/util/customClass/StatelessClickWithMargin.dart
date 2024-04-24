import 'package:flutter/cupertino.dart';

abstract class  StatelessClickWithMargin extends StatelessWidget {
  final void Function() onClick;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double? width;
  final double? height;

  const StatelessClickWithMargin({
    super.key,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.width,
    this.height,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        width: width,
        height: height,
        child : child(context)
      ),
    );
  }

  Widget child(BuildContext context);
}