import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey.shade100,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(19))),
                  height: MediaQuery.of(context).size.height * .7.h,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          "Comment",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 50.h,
                          child: const TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                hintText: "Enter your comment"),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                );
              },
              context: context);
        },
        child: const Text('Comments'));
  }
}
