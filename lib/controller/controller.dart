import 'dart:math';

import 'package:flutter/material.dart';

class ControllerAnimation {
  ControllerAnimation({required TickerProvider vsync}) {
    animationController =
        AnimationController(vsync: vsync, duration: const Duration(seconds: 1));
  }
  late AnimationController animationController;
  int? indexSelected;
  int? oldIndex;

  execute(int index) async {
    if (indexSelected != index) {
      if (animationController.isCompleted) {
        animationController.reset();
      }
      animationController.forward();
      oldIndex = indexSelected;
      indexSelected = index;
    }
  }

  Color? getBgColor(int index) {
    if (indexSelected == index) {
      return ColorTween(begin: Colors.white, end: Colors.blue)
          .animate(animationController)
          .value;
    } else if (oldIndex == index) {
      return ColorTween(begin: Colors.blue, end: Colors.white)
          .animate(animationController)
          .value;
    }
    return Colors.white;
  }

  Color? getTxtColor(int index) {
    if (indexSelected == index) {
      return ColorTween(begin: Colors.grey, end: Colors.black)
          .animate(animationController)
          .value;
    } else if (oldIndex == index) {
      return ColorTween(begin: Colors.black, end: Colors.grey)
          .animate(animationController)
          .value;
    }
    return Colors.grey;
  }

  double getRotation(int index) {
    if (indexSelected == index) {
      return Tween<double>(begin: 0.0, end: pi / 2)
          .animate(
            CurvedAnimation(
              parent: animationController,
              curve: Curves.linear,
            ),
          )
          .value;
    } else if (oldIndex == index) {
      return Tween<double>(begin: pi / 2, end: 0)
          .animate(
            CurvedAnimation(
              parent: animationController,
              curve: Curves.linear,
            ),
          )
          .value;
    }
    return 0.0;
  }

  double factorHeight(int index) {
    if (indexSelected == index) {
      return Tween<double>(begin: 0, end: 1).animate(animationController).value;
    } else if (oldIndex == index) {
      return Tween<double>(begin: 1, end: 0).animate(animationController).value;
    }
    return 0.0;
  }
}
