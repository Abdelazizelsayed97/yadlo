import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/core/helper/spacing.dart';

class React {
  final String image;
  final String react;

  React({required this.image, required this.react});
}

List<React> reacts = [
  React(image: 'assets/posts/happy.svg', react: 'Happy'),
  React(image: 'assets/posts/good.svg', react: 'Good'),
  React(image: 'assets/posts/ok.svg', react: 'Ok'),
  React(image: 'assets/posts/ok.svg', react: 'Sad'),
  React(image: 'assets/posts/angry.svg', react: 'Angry'),
];

List<Widget> emoji = [];
List<String> impretion = ['Happy', 'Good', 'Ok', 'Sad', 'Angry'];

class IconReactButton extends StatefulWidget {
  const IconReactButton({super.key});

  @override
  State<IconReactButton> createState() => _IconReactButtonState();
}

class _IconReactButtonState extends State<IconReactButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.separated(
          itemBuilder: (context, index) => Container(width: 30.h,
            child: MaterialButton(
              height: 30.h,
              elevation: 0.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              child:Text(impretion[index])
              // SvgPicture.asset(reacts[index].image),
            ),
          ),
          separatorBuilder: (context, index) => horizontalSpace(10),
          itemCount: 5,
        )
      ],
    );
  }
}
