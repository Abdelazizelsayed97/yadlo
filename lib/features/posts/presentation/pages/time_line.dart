import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/posts/presentation/widgets/common_widgets.dart';
import 'package:yadlo/features/posts/presentation/widgets/post_widget.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({super.key});

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AppThemeData(),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 32.h,
                          width: 32.w,
                          child: CommonWidgets().circleAvatar),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.bell)),
                    ],
                  ),
                ),
                verticalSpace(20),
                Container(
                  height: MediaQuery.of(context).size.height.h ,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => PostWidget(
                      likes: '',
                    ),
                    itemCount: 25,
                    separatorBuilder: (BuildContext context, int index) =>
                        verticalSpace(20),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
