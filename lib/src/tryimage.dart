import 'package:flutter/material.dart';

class TryImage extends StatelessWidget {
  const TryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Image.asset('assets/empty/favorite.png'),
        ),
      ),
    );
  }
}
