import 'package:flutter/material.dart';
import 'package:project2/src/view/widgets/responsive/responsive_layout.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (ResponsiveLayout.isDesktop(context))
            Container(
              margin: EdgeInsets.all(20),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10),
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 50,
              ),
            ),
        ],
      ),
    );
  }
}
