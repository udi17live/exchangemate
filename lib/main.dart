import 'package:exchangemate/constants/constants.dart';
import 'package:exchangemate/pages/ExchangeScreen.dart';
import 'package:exchangemate/providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ExchangeMate());
}

class ExchangeMate extends StatelessWidget {
  const ExchangeMate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
                title: 'exchangemate.',
                debugShowCheckedModeBanner: false,
                themeMode: value.themeMode,
                theme: light,
                darkTheme: dark,
                home: ExchangeScreen(),
              )),
    );
  }
}
