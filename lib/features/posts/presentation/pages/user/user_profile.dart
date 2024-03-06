import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/features/posts/presentation/widgets/common_view.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, 55.h),
      child: const AppBarWidget()),

      body: const Stack(
        children: [
          AppThemeData(),
          Column(
            children: [


            ],
          )
        ],
      ),
    );
  }
}
