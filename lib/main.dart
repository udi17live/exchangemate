import 'package:exchangemate/Layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExchangeMateApp());
}

class ExchangeMateApp extends StatelessWidget {
  const ExchangeMateApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExchangeMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'ExchangeMate'),
      home: Layout(),
    );
  }
}
