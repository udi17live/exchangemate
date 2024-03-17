import 'package:exchangemate/widgets/CustomRadioButtonWidget.dart';
import 'package:exchangemate/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class OnboardingPage2 extends StatefulWidget {
  const OnboardingPage2({super.key});

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

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
          "Select your color scheme.",
          style: TextStyle(
            fontSize: 18.0,
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "This is your color scheme. Pick between light and dark mode, and you can easily switch it later via the app header whenever you want.",
          style: TextStyle(fontSize: 14.0, color: colorScheme.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomRadioButtonWidget(
              value: 1,
              groupValue: _value,
              leading: HeroIcons.sun,
              onChanged: (value) => setState(() => _value = value!),
            ),
            CustomRadioButtonWidget(
              value: 2,
              groupValue: _value,
              leading: HeroIcons.moon,
              onChanged: (value) => setState(() => _value = value!),
            ),
            CustomRadioButtonWidget(
              value: 3,
              groupValue: _value,
              leading: HeroIcons.computerDesktop,
              onChanged: (value) => setState(() => _value = value!),
            )
          ],
        )
      ],
    );
  }
}
