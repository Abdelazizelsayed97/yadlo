import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/posts/data/model/Postsmodel.dart';
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
        const AppThemeData(),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    horizontalSpace(20),
                    Container(
                        height: 32.h,
                        width: 32.w,
                        child: CommonWidgets().circleAvatar),
                    horizontalSpace(230.w),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.bell)),

                    // PostWidget2(posts:Posts(username: username, profilePictureUrl: profilePictureUrl, postDate: postDate, likes: likes, awards: awards, location: location, title: title, contentImageURL: contentImageURL))
                  ],
                ),
                const PostWidget(
                  post: PostModel(
                      id: 112, title: 'title', body: 'body', image: ''),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
