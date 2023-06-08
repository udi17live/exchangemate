import 'package:flutter/material.dart';

class LatestPage extends StatelessWidget {
  const LatestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text(
          "Latest",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
