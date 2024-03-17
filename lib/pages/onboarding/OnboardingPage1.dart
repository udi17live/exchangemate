import 'package:exchangemate/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:currency_picker/currency_picker.dart';

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  String? defaultCurrency = null;
  String? currencyName = null;

  void setDefaultCurrency(Currency currency) {
    setState(() {
      defaultCurrency = currency.code;
      currencyName = currency.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> getPreferences() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs;
    }

    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return FutureBuilder(
      future: getPreferences(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          SharedPreferences? _sharedPreferences = snapshot.data;
          String? defaultCurrency =
              _sharedPreferences?.getString("defaultCurrencyCode");

          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Logo(
                  fontSize: 42.0,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                "Select your default Currency.",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary),
              ),
              SizedBox(height: 20.0),
              Text(
                "Think of this currency as your default choice on the home screen. When you check out currency exchange rates, it'll be the reference point. And if you ever want to change things, just head to the settings screen.",
                style: TextStyle(fontSize: 14.0, color: colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
              Container(
                width: 350.0,
                child: ElevatedButton.icon(
                  icon: defaultCurrency == null
                      ? HeroIcon(HeroIcons.currencyDollar)
                      : CircleAvatar(
                          radius: 11,
                          backgroundImage: AssetImage(
                            'icons/currency/${defaultCurrency?.toLowerCase()}.png',
                            package: 'currency_icons',
                          ),
                        ),
                  onPressed: () {
                    showCurrencyPicker(
                      context: context,
                      theme: CurrencyPickerThemeData(
                        flagSize: 25,
                        titleTextStyle: TextStyle(fontSize: 17),
                        subtitleTextStyle: TextStyle(
                            fontSize: 15, color: Theme.of(context).hintColor),
                        bottomSheetHeight:
                            MediaQuery.of(context).size.height / 2,
                        //Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      onSelect: (Currency currency) {
                        _sharedPreferences?.setString(
                            "defaultCurrencyCode", currency.code);
                        _sharedPreferences?.setString(
                            "defaultCurrencyName", currency.name);
                        setDefaultCurrency(currency);
                      },
                    );
                  },
                  label: Text(currencyName != null
                      ? "${currencyName} ( ${defaultCurrency} )"
                      : "Select Currency"),
                ),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
