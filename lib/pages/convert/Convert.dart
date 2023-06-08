import 'package:flutter/material.dart';

class ConvertPage extends StatelessWidget {
  const ConvertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: Text(
          "Convert",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
