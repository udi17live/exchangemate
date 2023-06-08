import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text(
          "More",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
