import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/post_cubit.dart';
import 'package:yadlo/features/posts/presentation/pages/get_posts/time_line.dart';
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
      create: (context) => PostCubit(getIt(), getIt(), getIt()),
      child: _CreateReviewBody(
        input: input,
      ),
    );
  }
}

class _CreateReviewBody extends StatefulWidget {
  final CreateReviewInput input;
  final Widget? widget;
  final VoidCallback? onTap;

  const _CreateReviewBody({
    super.key,
    required this.input,
    this.widget,
    this.onTap,
  });

  @override
  State<_CreateReviewBody> createState() => _createReviewBodyState();
}

class _createReviewBodyState extends State<_CreateReviewBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  OverAllRatingEnum? rate;
  bool isLoading = false;
  late String _fileName;
  late XFile? _imgFile;
  int isSelected = -1;
  AttachmentsModelInput? _selectedAttachment;
  late ImagePicker piker = ImagePicker();

  void snapShot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage = await picker.pickImage(
      source: ImageSource.camera, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (selectedImage != null) {
      setState(() {
        _imgFile = selectedImage;
      });
    }
  }

  void upLoadSelectedImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (pickedFile == null) {
      return;
    } else {
      final attachmentType = pickedFile.path.endsWith(".mp3")
          ? AttachmentType.video
          : AttachmentType.photo;
      _selectedAttachment = AttachmentsModelInput(
        imageUrl: pickedFile.path,
        attachmentType: attachmentType,
      );
      print('=====Image== $_selectedAttachment');
      setState(() {});
    }
  }

  void pickFileBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                snapShot();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                upLoadSelectedImage();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) async {
          if (state is CreateReviewLoadingState) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManger.primary,
                ),
              ),
            );
          }
          if (state is CreateReviewSuccessState) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TimeLinePage()));
          }
          if (state is CreateReviewFailureState) {
            // Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 3),
                content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Stack(children: [
            const AppThemeData(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomTitlePlaces(),
                    verticalSpace(15),
                    InkWell(
                      onTap: () {
                        pickFileBottomSheet();
                      },
                      child: Container(
                        height: 150.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                              image: AssetImage(
                                Assets.postsVector,
                              ),
                            )),
                        foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            scale: 2,
                            image:
                                (_selectedAttachment?.imageUrl.isEmpty ?? false)
                                    ? const AssetImage(
                                        'assets/posts/uploadlogo.png',
                                      )
                                    : AssetImage(
                                        _selectedAttachment?.imageUrl ?? ''),
                          ),
                        ),
                        child: Image.asset(_selectedAttachment?.imageUrl??''),
                      ),
                    ),
                    verticalSpace(22),
                    Container(
                      height: 120.h,
                      width: 330.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            child: ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    final xx = OverAllRatingEnum.values[index];
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
                                            child:
                                                SvgPicture.asset(emoji[index]))
                                        : SvgPicture.asset(emoji[index])),
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
                                      horizontalSpace(10),
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
                    verticalSpace(25),
                    CommonView(
                      descriptionController: descriptionController,
                      titleController: titleController,
                      onTap: () {
                        print('${widget.input}');
                        _addRviewPressed(context);
                        print('${widget.input}');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

  void _addRviewPressed(BuildContext context) async {
    if (context.read<PostCubit>().formKey.currentState?.validate() ?? true) {
      context.read<PostCubit>().createReview(
            input: CreateReviewInput(
                attachments: _selectedAttachment,
                categoryId: widget.input.subcategoryId,
                subcategoryId: widget.input.subcategoryId,
                title: titleController.text,
                name: widget.input.name,
                description: descriptionController.text,
                selectedType: widget.input.selectedType,
                overallRating: rate),
          );
    } else if (!context.read<PostCubit>().formKey.currentState!.validate()) {
      throw Exception();
    }
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
