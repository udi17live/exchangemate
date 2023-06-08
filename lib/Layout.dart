import 'package:exchangemate/pages/convert/convert.dart';
import 'package:exchangemate/pages/latest/latest.dart';
import 'package:exchangemate/pages/mode/More.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List pages = [const ConvertPage(), const LatestPage(), const MorePage()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EXCHANGEMATE"),
        actions: [
          HeroIcon(
            HeroIcons.moon,
            style: HeroIconStyle.outline,
            size: 32,
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onTap,
        itemPadding: EdgeInsets.all(24),
        items: [
          SalomonBottomBarItem(
              icon: HeroIcon(HeroIcons.arrowsRightLeft,
                  style: HeroIconStyle.outline),
              title: Text("Convert")),
          SalomonBottomBarItem(
              icon: HeroIcon(HeroIcons.bolt, style: HeroIconStyle.outline),
              title: Text("Latest")),
          SalomonBottomBarItem(
              icon: HeroIcon(HeroIcons.bars2, style: HeroIconStyle.outline),
              title: Text("More"))
        ],
      ),
    );
  }
}
