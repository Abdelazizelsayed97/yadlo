import 'package:flutter/material.dart';

import '../Widgets/costum_pageview.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomPageView(),
    );
  }
}
