import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/features/posts/presentation/widgets/common_view.dart';
import 'package:yadlo/generated/assets.dart';

import '../../../../../cache/colors/colors.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 55.h),
            child: const AppBarWidget(
              text: 'User Profile',
            )),
        body: Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: appTheme,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
          child: const UserProfileBody(),
        ));
  }
}

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kk(context),
            ],
          ),
        ),
        ListTile(
          title: Text(
            "Reem Doe Mini ",
            style: Styles.semiBlod(fontSize: 16, color: Colors.black),
          ),
          subtitle: Text(
            "Reem5767o@gmail.com",
            strutStyle: StrutStyle.fromTextStyle(const TextStyle(height: .04)),
            style: Styles.normal(fontSize: 10),
          ),
        )
      ],
    );
  }

  Widget kk(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              "assets/posts/pepsi.png",
              scale: 2,
            ),
            CircleAvatar(
              maxRadius: 40,
              child: Image.asset(Assets.postsUploadlogo),
            )
          ],
        ));
  }
}
