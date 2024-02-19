import 'package:flutter/material.dart';

class PanelRight extends StatefulWidget {
  const PanelRight({super.key});

  @override
  State<PanelRight> createState() => _PanelRightState();
}

class _PanelRightState extends State<PanelRight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
    );
  }
}
