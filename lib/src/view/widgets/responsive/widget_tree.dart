import 'package:flutter/material.dart';
import 'package:project2/src/view/widgets/responsive/appbar_widget.dart';
import 'package:project2/src/view/widgets/responsive/drawer.dart';
import 'package:project2/src/view/widgets/responsive/panel_center.dart';
import 'package:project2/src/view/widgets/responsive/panel_left.dart';
import 'package:project2/src/view/widgets/responsive/panel_right.dart';
import 'package:project2/src/view/widgets/responsive/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: ResponsiveLayout.istinyLimit(context) ||
                ResponsiveLayout.istinyHeightLimit(context)
            ? Container()
            : AppbarWidget(),
      ),
      body: ResponsiveLayout(
        desktop: Row(
          children: [
            DrawerPage(),
            Expanded(child: PanelLeft()),
            Expanded(child: PanelCenter()),
            Expanded(child: PanelRight()),
          ],
        ),
        tablet: Container(),
        tiny: Container(),
        phone: PanelCenter(),
        largetablet: Row(
          children: [
            Expanded(child: PanelLeft()),
            Expanded(child: PanelCenter()),
            Expanded(child: PanelRight()),
          ],
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}
