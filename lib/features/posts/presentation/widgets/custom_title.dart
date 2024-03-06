import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/core/helper/spacing.dart';

import '../pages/get_posts/time_line.dart';

class CustomTitleProduct extends StatelessWidget {
  const CustomTitleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 40,
              )),
          horizontalSpace(40.w),
          // SizedBox(width: MediaQuery.of(context).size.width * 0.203),
          const Text(
            'Add Review',
            style: TextStyle(
              color: Color(0xFF0B1A51),
              fontSize: 18,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * .25),
        ],
      ),
    );
  }
}

class CustomTitlePlaces extends StatelessWidget {
  const CustomTitlePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TimeLinePage()));
            },
            child: const Icon(
              Icons.arrow_back,
              size: 40,
            )),
        SizedBox(width: MediaQuery.of(context).size.width * 0.203),
        const Text(
          'Place location',
          style: TextStyle(
            color: Color(0xFF0B1A51),
            fontSize: 16,
            fontFamily: 'Somar Sans',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .29),
      ],
    );
  }
}
