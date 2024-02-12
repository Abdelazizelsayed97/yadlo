import 'package:flutter/material.dart';
import 'package:yadlo/generated/assets.dart';

class CommonWidgets {
  late String image;
  Widget circleAvatar = CircleAvatar(
    radius: 50,
    child: Ink.image(image: const AssetImage(Assets.postsProfilepix)),
  );
}
