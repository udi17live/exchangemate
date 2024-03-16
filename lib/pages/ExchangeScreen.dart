import 'package:flutter/material.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("exchangemate."),
        actions: const [Icon(Icons.settings)],
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
