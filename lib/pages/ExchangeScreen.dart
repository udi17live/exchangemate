import 'package:exchangemate/widgets/CurrencyPickerButton.dart';
import 'package:exchangemate/widgets/EMAppBar.dart';
import 'package:exchangemate/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:currency_picker/currency_picker.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  String? defaultCurrency = null;
  String? defaultCurrencyName = null;

  String? fromCurrencyCode = null;
  String? fromCurrencyName = null;
  String? toCurrencyCode = null;
  String? toCurrencyName = null;

  void setDefaultCurrency(Currency currency) {
    setState(() {
      defaultCurrency = currency.code;
      defaultCurrencyName = currency.name;
    });
  }

  void setFromCurrencyData(String? currencyCode, String? currencyName) {
    setState(() {
      // print(currencyCode);
      // print(currencyName);
      fromCurrencyCode = currencyCode;
      fromCurrencyName = currencyName;
      // print(fromCurrencyCode);
      // print(fromCurrencyName);
    });
  }

  void setToCurrencyData(String? currencyCode, String? currencyName) {
    setState(() {
      toCurrencyCode = currencyCode;
      toCurrencyName = currencyName;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> getPreferences() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs;
    }

    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: EMAppBar(),
      body: FutureBuilder(
        future: getPreferences(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            SharedPreferences? _sharedPreferences = snapshot.data;
            fromCurrencyCode =
                _sharedPreferences?.getString("defaultCurrencyCode");
            fromCurrencyName =
                _sharedPreferences?.getString("defaultCurrencyName");

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FROM:",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary),
                  ),
                  SizedBox(height: 5.0),
                  CurrencyPickerButton(
                    currencyCode: fromCurrencyCode,
                    currencyName: fromCurrencyName,
                    setCurrencyData: setFromCurrencyData,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "TO:",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary),
                  ),
                  SizedBox(height: 5.0),
                  CurrencyPickerButton(
                    currencyCode: toCurrencyCode,
                    currencyName: toCurrencyName,
                    setCurrencyData: setToCurrencyData,
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
