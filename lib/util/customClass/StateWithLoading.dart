import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sampl/util/design/color.dart';

abstract class StateWithOverlay<T extends StatefulWidget> extends State<T> {
  OverlayEntry? overlayEntry;

  void onPop(bool value) {
    stopLoading();
  }

  void startLoadingOverlay() {
    overlayEntry = OverlayEntry(
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color50444444,
            child:  Center(
              child: CircularProgressIndicator(
                color: color88BE2E,
              ),
            ),
          ) ,
        );
      },
    );

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
    });
  }

  void stopLoading() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(onPopInvoked: onPop, child: child(context));
  }

  Widget child(BuildContext context);

}