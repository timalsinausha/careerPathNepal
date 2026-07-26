import 'package:flutter/material.dart';

import '../auth/onboarding_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final PageController controller =
      PageController();

  int currentIndex = 0;

  List<OnboardingModel> pages = [

    OnboardingModel(
      title: "Your future starts\nhere.",
      image: "assets/images/onboarding1.png",
    ),

    OnboardingModel(
      title: "Build your dream\ncareer today.",
      image: "assets/images/onboarding2.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          Colors.grey.shade200,

      body: SafeArea(
        child: Column(
          children: [

            /// PAGEVIEW
            Expanded(
              child: PageView.builder(
                controller: controller,

                itemCount: pages.length,

                onPageChanged: (index) {

                  setState(() {
                    currentIndex = index;
                  });
                },

                itemBuilder: (context, index) {

                  return OnboardingPage(
                    data: pages[index],
                  );
                },
              ),
            ),

            /// INDICATOR
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: List.generate(
                pages.length,

                (index) {

                  return PageIndicator(
                    isActive:
                        currentIndex == index,
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            /// BUTTON
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 30,
              ),

              child: CustomButton(
                text: currentIndex == 1
                    ? "Get Started"
                    : "Next",

                onTap: () {

                  if (currentIndex <
                      pages.length - 1) {

                    controller.nextPage(
                      duration:
                          const Duration(
                        milliseconds: 400,
                      ),

                      curve: Curves.easeIn,
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}