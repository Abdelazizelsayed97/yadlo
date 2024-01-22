import 'package:flutter/material.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/features/posts/presentation/pages/place_review.dart';
import 'package:yadlo/features/posts/presentation/pages/time_line.dart';

class AddReviewPlace extends StatefulWidget {
  const AddReviewPlace({super.key});

  @override
  State<AddReviewPlace> createState() => _AddReviewPlaceState();
}

class _AddReviewPlaceState extends State<AddReviewPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppThemeData(),
          PlaceReviewBody(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TimeLinePage()));
            },
            image: 'assets/posts/pepsi.png',
            // widget: OptionalReview(
            //   text: Text('Give a specific rate (optional)'),
            // ),
          ),
        ],
      ),
    );
  }
}
