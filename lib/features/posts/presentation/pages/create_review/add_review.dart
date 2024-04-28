import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/features/posts/presentation/pages/create_review/add_review_2.dart';

import '../../../domain/entities /create_post_input.dart';
import '../../widgets/common_view.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
          child: const AppBarWidget(text: 'Add Review',)),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: appTheme,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const SafeArea(child: AddReviewBody()),
      ),
    );
  }
}

class AddReviewBody extends StatefulWidget {
  const AddReviewBody({super.key});

  @override
  State<AddReviewBody> createState() => _AddReviewBodyState();
}

class _AddReviewBodyState extends State<AddReviewBody> {
  SelectedTypeEnum? _selectedType;
  bool isDisabled = false;
  void _isFilled(){
    if(isDisabled == false){
      return;

    }else{
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddReview2(
              type: _selectedType == SelectedTypeEnum.product
                  ? SelectedTypeEnum.product
                  : SelectedTypeEnum.place)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final type = SelectedTypeEnum.values[index];
              return ListTile(
                title: Container(
                  height: 270.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(19)),
                      color: _selectedType == type
                          ? const Color(0xff0B1A51)
                          : Colors.transparent,
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        type.icon,
                        height: 100.h,
                      ),
                      verticalSpace(15),
                      Text(
                        type.localizationName,
                        style: Styles.semiBlod(
                            color: _selectedType == type
                                ? Colors.white
                                : Colors.black,
                            fontSize: 13),
                      ),
                      verticalSpace(15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          type.subTitle,
                          style: Styles.meduim(
                              color: _selectedType == type
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  _selectedType = type;
                  if (_selectedType == null) {
                    isDisabled = false;
                  } else {
                    isDisabled = true;
                  }
                  setState(() {});
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: SelectedTypeEnum.values.length,
          ),
        ),
        SafeArea(
          top: false,
          child: GeneralButton1(
            colors: isDisabled == false ? appTheme : gradientPrimyColors,
            width: SizeConfig.defaultSize! * 33,
            onTap: () {
              _isFilled();
            },
            text: 'Next',
          ),
        ),
      ],
    );
  }
}
