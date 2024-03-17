import 'dart:ffi';

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? fontSize;
  const Logo({super.key, this.fontSize = 32.0});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "exchange",
          style: TextStyle(
            fontSize: fontSize,
            color: colorScheme.primary,
          ),
        ),
        Text(
          "mate.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
