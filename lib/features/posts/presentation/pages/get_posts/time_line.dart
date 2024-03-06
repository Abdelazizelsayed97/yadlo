import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/posts/domain/entities%20/posts_entity.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/post_cubit.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/search_page.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/widgets/build_review_item.dart';
import 'package:yadlo/features/posts/presentation/widgets/common_widgets.dart';

import '../create_review/add_review.dart';
import '../user/user_profile.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(getIt(), getIt(), getIt()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfilePage()));
                },
                child: SizedBox(
                  height: 33.h,
                  width: 33.w,
                  child: CommonWidgets.circleAvatar,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bell,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80.h,
          decoration: const BoxDecoration(
              color: Color(0xff0B1A51),
              borderRadius: BorderRadius.all(Radius.elliptical(100, 400))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                CupertinoIcons.home,
                size: 40,
                color: Colors.white,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddReviewPage(),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/posts/createReview.svg',
                      height: 60.h,
                    ),
                  ),
                ],
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchDelegated()));
                },
                icon: const Icon(
                  CupertinoIcons.search,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        body: const TimeLineBody(),
      ),
    );
  }
}

class TimeLineBody extends StatefulWidget {
  const TimeLineBody({super.key});

  @override
  State<TimeLineBody> createState() => _TimeLineBodyState();
}

class _TimeLineBodyState extends State<TimeLineBody> {
  final ScrollController _scrollController = ScrollController();

  final PagingController<int, PostsEntity> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 2);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<PostCubit>(context).getAllPosts(pageKey);
    });
    super.initState();
  }

  void onDataLoaded(PostSuccess state) {
    try {
      final lastItem = !(state.getPostState.pageInfo.hasNext);
      if (lastItem) {
        _pagingController.appendLastPage(state.getPostState.dataItems);
      } else {
        final nextPageKey = state.getPostState.pageInfo.page + 1;
        _pagingController.appendPage(state.getPostState.dataItems, nextPageKey);
      }
    } catch (e) {
      _pagingController.error(e);
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostSuccess) {
          onDataLoaded(state);
        } else if (state is PostFailure) {
          _pagingController.error = state;
        }
      },
      builder: <PostCubit, PostState>(context, state) {
        return Stack(
          children: [
            const AppThemeData(),
            RefreshIndicator(
              onRefresh: () async {
                _pagingController.refresh();
              },
              child: PagedListView<int, PostsEntity>.separated(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<PostsEntity>(
                    newPageErrorIndicatorBuilder: (context) {
                  return const SizedBox.shrink();
                }, newPageProgressIndicatorBuilder: (context) {
                  Future.delayed(Duration(seconds: 3));
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorsManger.primary,
                    ),
                  );
                }, itemBuilder: (context, PostsEntity item, index) {
                  return BuildReviewItem(
                    postItem: item,
                    onRemoveItem: () {
                      _pagingController.itemList?.removeAt(index);
                      // removePost(item.postId);
                      setState(() {});
                    },
                    likes: '',
                  );
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return verticalSpace(20);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
