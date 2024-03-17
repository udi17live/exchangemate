import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:heroicons/heroicons.dart';

class CurrencyPickerButton extends StatefulWidget {
  final String? currencyCode;
  final String? currencyName;
  final double? width;
  final double? height;
  final Function(String currencyCode, String currencyName) setCurrencyData;

  const CurrencyPickerButton({
    super.key,
    required this.currencyCode,
    required this.currencyName,
    this.width = 350.0,
    this.height = 60.0,
    required this.setCurrencyData,
  });

  @override
  State<CurrencyPickerButton> createState() => _CurrencyPickerButtonState();
}

class _CurrencyPickerButtonState extends State<CurrencyPickerButton> {
  String? currencyCodeDup;
  String? currencyNameDup;

  @override
  void initState() {
    currencyCodeDup = widget.currencyCode;
    currencyNameDup = widget.currencyName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.only(right: 8.0),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: InkWell(
        onTap: () {
          showCurrencyPicker(
            context: context,
            theme: CurrencyPickerThemeData(
              flagSize: 30,
              titleTextStyle:
                  TextStyle(fontSize: 16, color: colorScheme.primary),
              currencySignTextStyle:
                  TextStyle(fontSize: 20, color: colorScheme.primary),
              subtitleTextStyle:
                  TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
              bottomSheetHeight: (MediaQuery.of(context).size.height / 3) * 2,
              //Optional. Styles the search field.
              inputDecoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Start typing to search',
                prefixIcon: const Icon(Icons.search),
                hintStyle: TextStyle(fontSize: 16, color: colorScheme.primary),
                labelStyle: TextStyle(fontSize: 16, color: colorScheme.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
            onSelect: (Currency currency) {
              widget.setCurrencyData(currency.code, currency.name);
              setState(() {
                currencyCodeDup = currency.code;
                currencyNameDup = currency.name;
              });
            },
          );
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currencyCodeDup == null
                  ? HeroIcon(HeroIcons.currencyDollar)
                  : CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'icons/currency/${currencyCodeDup?.toLowerCase()}.png',
                        package: 'currency_icons',
                      ),
                    ),
              Text(
                currencyNameDup != null
                    ? "${currencyNameDup} ( ${currencyCodeDup} )"
                    : "Select Currency",
                style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              HeroIcon(HeroIcons.chevronDown)
            ]),
      ),
    );
  }
}
