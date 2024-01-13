import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/Onboarding/Presentation/Pages/SplashScreen.dart';

void main() {
  runApp(Yadlo());
}

class Yadlo extends StatelessWidget {
  const Yadlo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: const Size(375, 811),minTextAdapt: true,
      
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: const Splashscreen()),

    );
  }
}
