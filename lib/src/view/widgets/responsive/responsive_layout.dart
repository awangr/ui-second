import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largetablet;
  final Widget desktop;
  ResponsiveLayout(
      {super.key,
      required this.desktop,
      required this.tablet,
      required this.tiny,
      required this.phone,
      required this.largetablet});
  static final int tinyHeightLimit = 100;
  static final int tinyLimit = 270;
  static final int phoneLimit = 550;
  static final int tabletLimit = 800;
  static final int largeTablet = 1100;
  static bool istinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;
  static bool istinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;
  static bool isphone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;
  static bool istablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;
  static bool islargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > largeTablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < tinyLimit ||
            constraints.maxHeight < tinyHeightLimit) {
          return tiny;
        }
        if (constraints.maxWidth < phoneLimit) {
          return phone;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (constraints.maxWidth < largeTablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
