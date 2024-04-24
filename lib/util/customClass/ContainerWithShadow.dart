import 'package:flutter/material.dart';

class ContainerWithShadow extends StatelessWidget {

  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  const ContainerWithShadow({super.key,
    this.height,
    this.width,
    this.child,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }



}