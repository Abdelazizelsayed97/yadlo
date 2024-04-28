import 'package:fitted_gridview/fitted_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/auth/ui/pages/shared_preferances.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';

import '../post_cubit.dart';
import 'comment_widget.dart';

class BuildReviewItem extends StatefulWidget {
  final PostsEntity postItem;
  final String likes;
  final VoidCallback onRemoveItem;
  String cacheUser = SharedPrefs.getFromShard(key: 'userID');

  BuildReviewItem({
    super.key,
    required this.likes,
    required this.postItem,
    required this.onRemoveItem,
  });

  @override
  State<BuildReviewItem> createState() => _BuildReviewItemState();
}

class _BuildReviewItemState extends State<BuildReviewItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is DeleteReviewSuccessState) {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text("Removed Successfully")));
        }
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          // height: MediaQuery.of(context).size.height * .54.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        horizontalSpace(10),
                        CircleAvatar(
                            radius: 21,
                            child: InkWell(
                                child: Image.asset(
                                    'assets/posts/postprofile.png'))),
                        horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.postItem.user?.userName ?? '',
                              style: Styles.bold(fontSize: 12),
                            ),
                            Text('${widget.postItem.createdAt}',
                                style: Styles.normal(
                                  fontSize: 8,
                                  color: const Color(0xFF6B7495),
                                )),
                          ], // Add the missing closing square bracket here
                        ),
                      ],
                    ),
                    //
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/posts/followicon.svg',
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          color: Colors.white,
                          elevation: 10,
                          onSelected: (value) {
                            if (value == "delete") {
                              widget.onRemoveItem();
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text(
                                'Edit',
                                style: Styles.normal(fontSize: 10),
                              ),
                            ),
                            if (widget.postItem.user?.userID ==
                                widget.cacheUser) ...[
                              PopupMenuItem(
                                onTap: () {
                                  _handelDeleteReviewPressed(context);
                                },
                                value: 'delete',
                                child: Text(
                                  'Delete',
                                  style: Styles.normal(fontSize: 10),
                                ),
                              ),
                            ],
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postItem.name,
                          style: Styles.bold(
                              fontSize: 16, color: ColorsManger.timeLineText),
                        ),
                        Text(
                          widget.postItem.title,
                          style: Styles.bold(
                              fontSize: 14, color: ColorsManger.timeLineText),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/posts/locationmark.svg',
                                height: 12.h,
                              ),
                              horizontalSpace(4),
                              Text('Berlin- Italy',
                                  style: Styles.normal(
                                      fontSize: 10,
                                      color: const Color(0x9B0B1A51))),
                            ])
                      ],
                    ),
                    SvgPicture.asset("assets/posts/react.happy.svg",
                        height: 40.h),
                  ],
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.postItem.description,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    strutStyle: const StrutStyle(forceStrutHeight: true),
                    style: Styles.normal(
                        fontSize: 16, color: ColorsManger.timeLineText),
                  ),
                ),
              ),
              verticalSpace(12),
              if (widget.postItem.attachments.isNotEmpty)
                SizedBox(
                  height: 250.h,
                  width: MediaQuery.of(context).size.width.w,
                  child: FittedGridView(
                    maxItemDisplay: 4,
                    itemCount: widget.postItem.attachments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          widget.postItem.attachments[index].imageUrl ?? "",
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                    remainingItemsOverlay: (remaining) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Colors.grey.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: Text(
                            "+$remaining",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              verticalSpace(5),
              Container(
                padding: const EdgeInsets.only(right: 10),
                margin: EdgeInsets.only(bottom: 5.h),
                alignment: Alignment.centerRight,
                child: Text(
                  '${widget.postItem.commentsCount} Comments',
                  style: Styles.normal(color: Colors.grey, fontSize: 12),
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_upward_sharp,
                          color: Colors.greenAccent,
                        )),
                    Text('${widget.postItem.commentsCount}'),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.redAccent,
                        )),
                  ]),
                  const CommentWidget(),
                  TextButton(onPressed: () {}, child: const Text('Share')),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _handelDeleteReviewPressed(BuildContext context) {
    context.read<PostCubit>().deletePost(
          reviewId: widget.postItem.postId,
        );
  }
}
