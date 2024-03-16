import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultTextSize = 32.0;

    return const Row(
      children: [
        Text(
          "exchange",
          style: TextStyle(fontSize: defaultTextSize),
        ),
        Text(
          "mate.",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: defaultTextSize),
        ),
      ],
    );
  }
}
