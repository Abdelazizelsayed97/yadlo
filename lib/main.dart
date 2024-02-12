import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/features/auth/ui/widgets/login_widgets/shared_preferances.dart';

import 'features/Onboarding/Presentation/Pages/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.sharedInitialization();
   // SharedPrefs.removeFromShard(key: 'token');
  await AppDi.setupGetIt();
  runApp(const Yadlo());
}

class Yadlo extends StatelessWidget {
  const Yadlo({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(designSize: Size(375, 811),minTextAdapt: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splashscreen()),
    );
  }
}
