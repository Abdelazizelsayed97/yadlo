import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yadlo/cache/colors/colors.dart';
import 'package:yadlo/cache/text_styles/text_styles.dart';
import 'package:yadlo/cache/themData/them_data.dart';
import 'package:yadlo/core/buttons/general_button.dart';
import 'package:yadlo/core/di/dependency_injection.dart';
import 'package:yadlo/core/helper/spacing.dart';
import 'package:yadlo/core/textForm/custom_textform.dart';
import 'package:yadlo/features/posts/domain/entities%20/create_post_input.dart';
import 'package:yadlo/features/posts/presentation/pages/category/category_cubit.dart';
import 'package:yadlo/features/posts/presentation/pages/create_review/place_review.dart';

import '../../../../../core/textForm/drop_down_menu.dart';
import '../../../domain/entities /category/category_entity.dart';
import '../../widgets/common_view.dart';

class AddReview2 extends StatelessWidget {
  final SelectedTypeEnum type;
  const AddReview2({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryCubit(getIt())..onCubitStart(),
        child: AddReviewBody(
          type: type,
        ));
  }
}

class AddReviewBody extends StatefulWidget {
  final SelectedTypeEnum type;

  const AddReviewBody({
    super.key,
    required this.type,
  });

  @override
  State<AddReviewBody> createState() => _AddReviewBodyState();
}

class _AddReviewBodyState extends State<AddReviewBody> {

  final _productNameController = TextEditingController();


  CategoryModel? category;

  List<SubCategoryModel> subList = [];
  SubCategoryModel? subCategoryModel;

  bool _isDataFilled() {
    return _productNameController.text.isNotEmpty &&
        (subCategoryModel?.subCategoryId?.isNotEmpty ?? false) &&
        category?.categoryId != null;
  }

  void _navigateNextPress() {
    if (_isDataFilled() == true) {
      CreateReviewInput input = CreateReviewInput(
        subcategoryId: subCategoryModel?.subCategoryId,
        selectedType: widget.type,
        name: _productNameController.text,
        categoryId: category?.categoryId ?? '',
      );
      print('====Input== :$input');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CreateReviewPage(input: input),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
          child: const AppBarWidget(text: 'Add Review',)),
      body: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategorySuccess) {
            final data = state.categoryModel;
            return Stack(children: [
              const AppThemeData(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w)
                    .copyWith(top: 25.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      verticalSpace(20),
                      Row(
                        children: [
                          Text(
                            'Category',
                            style: Styles.light(fontSize: 12),
                          )
                        ],
                      ),
                      verticalSpace(10),
                      GenericDropDownMenu(
                        hintText: 'Selected Category',
                        texts: data.map((e) => e.enName ?? '').toList(),
                        onSelect: (selectedIndex) {
                          if (selectedIndex != null) {
                            setState(() {
                              category = data[selectedIndex];
                              category = category;
                            });
                          } else {
                            setState(() {
                              category = null;
                            });
                          }
                        },
                      ),
                      verticalSpace(10),
                      Row(
                        children: [
                          Text(
                            'SubCategory',
                            style: Styles.light(fontSize: 12),
                          )
                        ],
                      ),
                      verticalSpace(10),
                      GenericDropDownMenu(
                        hintText: 'Selected Sub Category',
                        texts: (category?.subcategories ?? [])
                            .map((e) => e.enName ?? '')
                            .toList(),
                        onSelect: (selectedIndex) {
                          if (selectedIndex != null) {
                            subCategoryModel =
                                category?.subcategories?[selectedIndex];
                          } else {
                            subCategoryModel = null;
                          }
                          setState(() {});
                        },
                      ),
                      verticalSpace(30),
                      TextForm2(
                        text: 'Name',
                        hintText: 'Product Name',
                        textEditingController: _productNameController,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                      verticalSpace(40),
                      GeneralButton1(
                        text: "Next",
                        onTap: _isDataFilled() ? _navigateNextPress : null,
                        colors:
                            _isDataFilled() ? gradientPrimyColors : appTheme,
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          } else if (state is CategoryLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorsManger.primary,
            ));
          } else if (state is CategoryFailure) {
            return const Center(child: Text('Fail to load'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    super.dispose();
  }
}
