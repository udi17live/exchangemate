import 'package:exchangemate/pages/ExchangeScreen.dart';
import 'package:exchangemate/theme/Theme.dart';
import 'package:exchangemate/theme/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const ExchangeMate(),
    );
  );
}

class ExchangeMate extends StatelessWidget {
  const ExchangeMate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exchangemate.',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const ExchangeScreen(),
    );
  }
}
