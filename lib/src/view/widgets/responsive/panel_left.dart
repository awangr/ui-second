import 'package:flutter/material.dart';

class PanelLeft extends StatefulWidget {
  const PanelLeft({super.key});

  @override
  State<PanelLeft> createState() => _PanelLeftState();
}

class _PanelLeftState extends State<PanelLeft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
