import 'package:flutter/material.dart';

import 'desktop.dart';
import 'mobile.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if (contraints.maxWidth < 500) {
          return Mobile();
        } else {
          return Desktop();
        }
      },
    );
  }
}
