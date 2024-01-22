import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/features/posts/presentation/pages/add_review_2.dart';
import 'package:yadlo/features/posts/presentation/widgets/custom_title.dart';

import '../widgets/custom_radio.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  bool selected = true;
  bool value = false;
  late Color color;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          AppThemeData(),
          Positioned(
              top: SizeConfig.defaultSize! * 7,
              left: SizeConfig.defaultSize! * 2,
              child: const CustomTitleProduct()),
          Positioned(
            top: 130.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RvType(
                    onTap: () {
                      if (value = selected = true) {
                        value = true;
                      }
                    },
                    image: 'assets/posts/product.svg',
                    title: 'Product',
                    subtitle:
                        "Add a Review For a tangible or not tangible Product you experienced it ",
                    defaultColor: Colors.transparent,
                    selectedColor: const Color(0xff0B1A51)),
                const SizedBox(
                  height: 20,
                ),
                RvType(
                  onTap: () {
                    if (value = selected = false) {
                      value = false;
                    }
                  },
                  image: 'assets/posts/location.svg',
                  title: 'Places',
                  subtitle:
                      "Add a Review For a Place that Served you, a Tourist place or any other place  ",
                  defaultColor: Colors.transparent,
                  selectedColor: const Color(0xff0B1A51),
                ),
                const SizedBox(
                  height: 20,
                ),
                GeneralButton1(
                  colors: ig3,
                  width: SizeConfig.defaultSize! * 33,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddReview2()));
                  },
                  text: 'Next',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
