import 'package:exchangemate/providers/ThemeProvider.dart';
import 'package:exchangemate/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class EMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Logo(),
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(
            icon: HeroIcon(
              Theme.of(context).brightness == Brightness.light
                  ? HeroIcons.moon
                  : HeroIcons.sun,
            ),
            onPressed: () {
              if (_themeProvider.themeMode == ThemeMode.dark) {
                _themeProvider.setLight();
              } else {
                _themeProvider.setDark();
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80.0);
}
