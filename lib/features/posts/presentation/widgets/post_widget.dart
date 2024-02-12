import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/helper/spacing.dart';

class PostWidget extends StatelessWidget {
  final String likes;

  // final PostModel post;

  const PostWidget({
    Key? key,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height.h * .51,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 21,
                    child: InkWell(
                        child: Image.asset('assets/posts/postprofile.png'))),

                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Reem Doe Minisha', style: Styles.bold(fontSize: 12)),
                    Text('May 2, 2020 at 04:00 PM',
                        style: Styles.normal(
                          fontSize: 8,
                          color: const Color(0xFF6B7495),
                        )),
                  ], // Add the missing closing square bracket here
                ), //
                horizontalSpace(120),
                SvgPicture.asset('assets/posts/followicon.svg'),
                PopupMenuButton(
                  color: Colors.white,
                  elevation: 10,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Edit',
                      child: Text(
                        'Edit',
                        style: Styles.normal(fontSize: 10),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'Delete',
                      child: Text(
                        'Delete',
                        style: Styles.normal(fontSize: 10),
                      ),
                    ),
                  ],
                ) // Add this closing parenthesis
              ],
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Diet Pepsi',
                      style: Styles.bold(
                          fontSize: 16, color: const Color(0xFF3B4773)),
                    ),
                    Text(
                      'The new skinny can',
                      style: Styles.bold(
                          fontSize: 14, color: const Color(0xFF3B4773)),
                    ),
                    Row(children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                      ),
                      Text('Berlin- Italy',
                          style: Styles.normal(
                              fontSize: 10, color: const Color(0x9B0B1A51))),
                    ])
                  ],
                ),
                SvgPicture.asset("assets/posts/react.happy.svg"),
              ],
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'A Perfect Bold Refreshment for All Parties, Events, & Social Gatherings! Perfect Size For Drinking With  ',
              style:
                  Styles.normal(fontSize: 16, color: const Color(0xFF3B4773)),
            ),
          ),
          verticalSpace(12),
          Container(width: double.maxFinite,child: Image.asset(
              'assets/posts/pepsie.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          verticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_upward_sharp,
                        color: Colors.greenAccent,
                      )),
                  const Text('1'),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.redAccent,
                      )),
                ]),
              ),
              TextButton(onPressed: () {}, child: const Text('Comments')),
              TextButton(onPressed: () {}, child: const Text('Share')),
            ],
          )
        ],
      ),
    );
  }
}
