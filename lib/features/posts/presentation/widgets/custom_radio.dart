import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yadlo/core/Sizeable/commonSizes.dart';

import '../../../../cache/text_styles/text_styles.dart';
import '../../domain/entities /create_post_input.dart';

class RvType extends StatefulWidget {
  RvType({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.defaultColor,
    required this.selectedColor,
    this.onTap,
  });

  final String image;
  final String title;
  final String subtitle;
  final Color defaultColor;
  final Color selectedColor;
  final void Function(String type)? onTap;
  SelectedTypeEnum x = SelectedTypeEnum.product;

  @override
  _RvTypeState createState() => _RvTypeState();
}

class _RvTypeState extends State<RvType> {
  late Color _containerColor;
  late Color _titleColor;
  late Color _subtitleColor;
   late final SelectedTypeEnum _selectedType;
  bool isSelected = false;

  @override
  void initState() {
    _containerColor = widget.defaultColor;
    _titleColor = Colors.black;
    _subtitleColor = Colors.black;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {


        setState(() {
          isSelected != isSelected ;
          _containerColor = (_containerColor == widget.defaultColor)
              ? widget.selectedColor
              : widget.defaultColor;

          _titleColor = (_containerColor == widget.defaultColor)
              ? Colors.black
              : Colors.white;
          _subtitleColor = (_containerColor == widget.defaultColor)
              ? Colors.black
              : Colors.white;
        });
        widget.onTap!(widget.title == "Product"
            ? SelectedTypeEnum.product.localizationName
            : SelectedTypeEnum.place.localizationName);

        print(widget.title);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey),
        ),
        width: 330.w,
        height: 270.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              widget.image,
              height: SizeConfig.defaultSize! * 9.5,
              width: SizeConfig.defaultSize! * 13,
            ),
            Text(
              widget.title,
              style: Styles.bold(color: _titleColor, fontSize: 20),
            ),
            Container(
                width: SizeConfig.defaultSize! * 28,
                alignment: Alignment.center,
                child: Text(
                  widget.subtitle ??
                      "Add a Review For a tangible or not tangible Product you experienced it  ",
                  style: Styles.meduim(color: _subtitleColor, fontSize: 13),
                )),
          ],
        ),
      ),
    );
  }
}
