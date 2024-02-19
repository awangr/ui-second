import 'package:flutter/material.dart';

class PanelCenter extends StatefulWidget {
  const PanelCenter({super.key});

  @override
  State<PanelCenter> createState() => _PanelCenterState();
}

class _PanelCenterState extends State<PanelCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
