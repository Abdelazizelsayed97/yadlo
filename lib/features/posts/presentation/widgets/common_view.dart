import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/generated/assets.dart';

import '../../../../core/textForm/custom_textform.dart';

class CommonView extends StatelessWidget {
  const CommonView({
    super.key,
    this.text,
    this.onTap,
    this.colors,
    this.width,
    this.color,
    this.textColor,
    this.onTap2,
    required this.descriptionController,
    required this.titleController,
    this.onChangedDescription,
    this.onChangedTitle,
  });

  final String? text;
  final VoidCallback? onTap;
  final VoidCallback? onTap2;
  final List<Color>? colors;
  final double? width;
  final Color? color;
  final Color? textColor;
  final TextEditingController descriptionController;
  final Function(String)? onChangedDescription;
  final TextEditingController titleController;
  final Function(String)? onChangedTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          TextForm2(
            onChanged: onChangedTitle,
            text: 'Title of Reivew*',
            textColor: const Color(0xFF3B4773),
            textEditingController: titleController,
          ),
          verticalSpace(15),
          TextForm2(
            onChanged: onChangedDescription,
            text: "Description*",
            maxLines: 4,
            borderRadius: BorderRadius.circular(30),
            textEditingController: descriptionController,
          ),
          verticalSpace(15),
          Container(
            width: 250.w,
            height: 54.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/posts/LocationIcon.svg',
                  height: 17.h,
                  width: 17.w,
                ),
                horizontalSpace(5),
                Text(
                  'Select Place Location ',
                  style: Styles.meduim(),
                )
              ],
            ),
          ),
          verticalSpace(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GeneralButton1(
                color: Colors.white,
                text: 'Cancel',
                width: 140.w,
                textColor: Colors.black,
                onTap: onTap2,
              ),
              GeneralButton1(
                color: Colors.white,
                text: 'Add Review',
                width: 140.w,
                textColor: Colors.white,
                colors: colors ?? gradientPrimyColors,
                onTap: onTap,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CommonRow extends StatelessWidget {
  const CommonRow({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              height: 25.h,
              width: 25.w,
              foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.postsShape))),
              child: Image.asset(
                'assets/posts/Path 315092.png',
              )),
          horizontalSpace(10),
          Text(
            text ?? 'Add a Specific Rate',
            style: const TextStyle(
              color: Color(0xFF0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class OptionalReview extends StatefulWidget {
  const OptionalReview({super.key, required this.text, this.textStyle});

  final Text text;
  final TextStyle? textStyle;

  @override
  State<OptionalReview> createState() => _OptionalReviewState();
}

class _OptionalReviewState extends State<OptionalReview> {
  late final String text;
  late final String text2;
  late final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      verticalSpace(20),
      Text(
        text,
        style: textStyle,
      ),
      Container(
          height: 120.h,
          width: 330.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(10),
              Text(
                text2,
                style: Styles.bold(),
              )
            ],
          ))
    ]);
  }
}

class AppBarWidget extends StatelessWidget {
  final String text;

  const AppBarWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        text,
        style: Styles.bold(
          color: const Color(0xFF0B1A51),
          fontSize: 18,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
          )),
    );
  }
}
