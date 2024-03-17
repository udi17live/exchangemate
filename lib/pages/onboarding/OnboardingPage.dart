import 'package:exchangemate/pages/ExchangeScreen.dart';
import 'package:exchangemate/pages/onboarding/OnboardingPage1.dart';
import 'package:exchangemate/pages/onboarding/OnboardingPage2.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 100, left: 16.0, right: 16.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 1;
              isFirstPage = index == 0;
            });
          },
          children: [
            OnboardingPage1(),
            OnboardingPage2(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 100,
        color: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isFirstPage)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () => controller.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
                  child: HeroIcon(
                    HeroIcons.arrowLeft,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(25),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .background, // <-- Button color
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide(
                          width: 3.0,
                          color: Theme.of(context)
                              .colorScheme
                              .primary) // <-- Splash color
                      ),
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () => isLastPage
                    ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ExchangeScreen()))
                    : controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                child: HeroIcon(
                  HeroIcons.arrowRight,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(25),
                  backgroundColor:
                      Theme.of(context).colorScheme.primary, // <-- Button color
                  foregroundColor: Theme.of(context)
                      .colorScheme
                      .secondary, // <-- Splash color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
