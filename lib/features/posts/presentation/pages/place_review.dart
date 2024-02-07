import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/features/posts/presentation/pages/add_review_place.dart';
import 'package:yadlo/features/posts/presentation/widgets/common_view.dart';
import 'package:yadlo/features/posts/presentation/widgets/custom_title.dart';

import '../../../../generated/assets.dart';

class PlaceReviewBody extends StatelessWidget {
  const PlaceReviewBody({super.key, this.image, this.widget, this.onTap, });
  final String? image;
  final Widget? widget;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
         const AppThemeData(),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTitlePlaces(),
                verticalSpace(15),
                Container(
                  height: 150.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      Assets.postsVector,
                    ),
                  )),
                  foregroundDecoration:  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image??
                    'assets/posts/uploadlogo.png',
                  ))),
                ),
                verticalSpace(22),
                Container(
                  height: 120.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(10),
                      Text('Over All Rate',style: Styles.bold(),),

                      const Row(
                        children: [
                          // IconReactButton()
                        ],
                      )
                    ],
                  ),
                ),
                verticalSpace(10),
                Container(child: widget,),


                const CommonRow(),
                verticalSpace(25),
                CommonView(onTap: onTap ?? (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddReviewPlace()));
                }),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
