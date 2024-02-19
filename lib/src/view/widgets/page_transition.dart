import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class PageTransition extends StatelessWidget {
  const PageTransition({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation,
          Animation<double> secondAnimation) {
        return FadeThroughTransition(
          secondaryAnimation: secondAnimation,
          animation: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
