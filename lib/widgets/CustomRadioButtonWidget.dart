import 'package:exchangemate/providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class CustomRadioButtonWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final HeroIcons leading;
  final ValueChanged<T?> onChanged;

  const CustomRadioButtonWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return ElevatedButton(
      onPressed: () {
        onChanged(value);
        switch (value) {
          case 1:
            _themeProvider.setLight();
            break;
          case 2:
            _themeProvider.setDark();
            break;
          case 3:
            _themeProvider.setSystem();
            break;
          default:
            _themeProvider.setSystem();
        }
      },
      child: HeroIcon(
        leading,
        size: 64,
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background, // <-- Button color
          foregroundColor: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
          side: BorderSide(
              width: 3.0,
              color: Theme.of(context).colorScheme.primary) // <-- Splash color
          ),
    );
  }

  // Widget get _customRadioButton {
  //   final isSelected = value == groupValue;
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //     decoration: BoxDecoration(
  //       color: isSelected ? Colors.blue : null,
  //       borderRadius: BorderRadius.circular(4),
  //       border: Border.all(
  //         color: isSelected ? Colors.blue : Colors.grey[300]!,
  //         width: 2,
  //       ),
  //     ),
  //     child: Text(
  //       leading,
  //       style: TextStyle(
  //         color: isSelected ? Colors.white : Colors.grey[600]!,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 18,
  //       ),
  //     ),
  //   );
}
