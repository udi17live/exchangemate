import 'package:exchangemate/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class EMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
              HeroIcons.moon,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80.0);
}
