import 'package:flutter/material.dart';

class CommonWidgets {
  late String image;
 static Widget circleAvatar = CircleAvatar(
    radius: 60 ,child: Image.asset('assets/posts/profilepix.png'),
    // child: Image(height: 50.h,fit: BoxFit.cover,
    //     image: const AssetImage(Assets.postsProfilepix)),
  );
}
