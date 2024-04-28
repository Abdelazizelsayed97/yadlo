import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/auth/ui/pages/shared_preferances.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
import 'package:yadlo/features/posts/domain/entities%20/upload_pix/upload_input.dart';
import 'package:yadlo/features/posts/presentation/pages/create_review/widgets/upload_cover_bottom_sheet.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/post_cubit.dart';
import 'package:yadlo/features/posts/presentation/widgets/common_view.dart';
import 'package:yadlo/features/posts/presentation/widgets/custom_title.dart';

import '../../../../../generated/assets.dart';

List<String> emoji = [
  Assets.postsHappy,
  Assets.postsGood,
  Assets.postsOk,
  Assets.postsSad,
  Assets.postsAngry
];

class CreateReviewPage extends StatelessWidget {
  final CreateReviewInput input;

  const CreateReviewPage({
    super.key,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(getIt(), getIt(), getIt(), getIt()),
      child: CreateReviewBody(
        input: input,
      ),
    );
  }
}

class CreateReviewBody extends StatefulWidget {
  final CreateReviewInput input;

  const CreateReviewBody({
    super.key,
    required this.input,
  });

  @override
  State<CreateReviewBody> createState() => _CreateReviewBodyState();
}

class _CreateReviewBodyState extends State<CreateReviewBody> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  OverAllRatingEnum? rate;
  bool isLoading = false;
  int isSelected = -1;

  String? imageUrl;
  AttachmentType? attachmentType;
  var link = SharedPrefs.getFromShard(key: 'imageUrl');

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool _onDataFilled() {
    return titleController.text.isNotEmpty &&
        (imageUrl?.isNotEmpty ?? false) &&
        descriptionController.text.isNotEmpty &&
        rate != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PostCubit, PostState>(
        listener: (context, state) {
          if (state is AddReviewLoading) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManger.primary,
                ),
              ),
            );
          } else if (state is AddReviewFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 3),
                content: Text(state.message)));
          } else if (state is AddReviewSuccess) {
            // state.link =link??"";
            // print('${link}');
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (state is UploadImageSuccess) {
            SharedPrefs.removeFromShard(key: 'imageUrl');
          }
        },
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            return Stack(children: [
              const AppThemeData(),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomTitlePlaces(),
                      verticalSpace(15),
                      InkWell(
                        onTap: () {
                          UploadCoverBottomSheet.showBottomSheet(
                            context: context,
                            onSelected: (selectedAttachment) {
                              imageUrl = selectedAttachment.imageUrl;
                              attachmentType =
                                  selectedAttachment.attachmentType;
                              setPix();
                              setState(() {});
                            },
                          );
                        },
                        child: Container(
                          width: 300.w,
                          height: 150.h,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.contain,
                              image: AssetImage(
                                Assets.postsVector,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                child: (imageUrl?.isEmpty ?? false) ||
                                        (imageUrl == null)
                                    ? Center(
                                        child: Image.asset(
                                          fit: BoxFit.fitWidth,
                                          'assets/posts/uploadlogo.png',
                                          scale: 2.5,
                                        ),
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: Image.asset(
                                          fit: BoxFit.cover,
                                          imageUrl ?? '',
                                        ),
                                      ),
                              ),
                              Positioned(
                                child: (imageUrl?.isEmpty ?? false) ||
                                        (imageUrl == null)
                                    ? const SizedBox.shrink()
                                    : IconButton(
                                        onPressed: () {
                                          imageUrl = '';
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          size: 30,
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(22),
                      Container(
                        height: 110.h,
                        width: 330.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.h,
                              child: ListView.separated(
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      final xx =
                                          OverAllRatingEnum.values[index];
                                      isSelected = index;
                                      rate = xx;
                                    });
                                  },
                                  child: SizedBox(
                                    width: 40.w,
                                    child: isSelected == index
                                        ? ShaderMask(
                                            shaderCallback: (Rect bounds) =>
                                                LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomCenter,
                                              colors: login1,
                                            ).createShader(bounds),
                                            child: SvgPicture.asset(
                                              emoji[index],
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : SvgPicture.asset(
                                            emoji[index],
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                itemCount: emoji.length,
                                shrinkWrap: true,
                                controller: ScrollController(
                                    keepScrollOffset: true,
                                    initialScrollOffset: 0),
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        horizontalSpace(15),
                              ),
                            ),
                            verticalSpace(10),
                            Text(
                              'Over All Rate',
                              style: Styles.bold(),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(10),
                      const CommonRow(),
                      verticalSpace(20),
                      CommonView(
                          onChangedTitle: (text) {
                            titleController.text = text;
                            setState(() {});
                          },
                          onChangedDescription: (text) {
                            descriptionController.text = text;
                            setState(() {});
                          },
                          colors:
                              _onDataFilled() ? gradientPrimyColors : appTheme,
                          descriptionController: descriptionController,
                          titleController: titleController,
                          onTap: _onDataFilled() == true
                              ? () async => _handelAddReviewPress()
                              : null,
                          onTap2: () => Navigator.pop(context)),
                    ],
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }

  void setPix() {
    context.read<PostCubit>().uploadImageCover(
            input: UploadInput(
          fileUrl: imageUrl ?? "",
          model: FileModelEnum.reviewAttachment,
        ));
  }

  void _handelAddReviewPress() async {
    // print('this is photo>>>>${imageUrl}');
    // BlocProvider.of<PostCubit>(context).createReview(
    //     input: CreateReviewInput(
    //         title: widget.input.title,
    //         name: widget.input.name,
    //         subcategoryId: widget.input.subcategoryId,
    //         categoryId: widget.input.categoryId,
    //         attachments: AttachmentsModelInput(
    //             imageUrl: imageUrl??"",
    //             attachmentType: widget.input.attachments!.attachmentType),
    //         description: descriptionController.text,
    //         overallRating: rate,
    //         selectedType: widget.input.selectedType));
    await context.read<PostCubit>().sendAddReview(
          inputUpload: UploadInput(
            fileUrl: imageUrl ?? "",
            model: FileModelEnum.reviewAttachment,
          ),
          inputCreate: CreateReviewInput(
            attachments: AttachmentsModelInput(
                attachmentType: attachmentType!, imageUrl: link),
            categoryId: widget.input.subcategoryId,
            subcategoryId: widget.input.subcategoryId,
            title: titleController.text,
            name: widget.input.name,
            description: descriptionController.text,
            selectedType: widget.input.selectedType,
            overallRating: rate,
          ),
        );
  }
}

extension ConvertOverAllRatingEnumToString on OverAllRatingEnum {
  String get localizationName {
    switch (this) {
      case OverAllRatingEnum.happy:
        return 'HAPPY';
      case OverAllRatingEnum.good:
        return 'GOOD';
      case OverAllRatingEnum.ok:
        return 'OK';
      case OverAllRatingEnum.sad:
        return 'SAD';
      case OverAllRatingEnum.angy:
        return 'ANGRY';
    }
  }
}
