import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yadlo/core/helper/spacing.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      this.textHint,
      this.icon,
      this.opsCureText,
      this.suffixIcon,
      required this.controller,
      required this.validator,
      this.label,
      this.onChanged});

  final TextEditingController controller;
  final String? label;
  final String? textHint;
  final Widget? icon;
  final bool? opsCureText;
  final Widget? suffixIcon;
  final Function(String?) validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
        onChanged: onChanged,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        autofocus: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return validator(value);
        },
        controller: controller,
        obscureText: opsCureText ?? false,
        decoration: InputDecoration(
            label: Text(label ?? ''),
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            filled: true,
            enabled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            hintText: textHint,
            prefixIcon: icon,
            contentPadding: const EdgeInsetsDirectional.all(15),
            hintStyle: const TextStyle(
              color: Color(0x600B1A51),
              fontSize: 14,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            prefixIconColor: const Color(0xff4051ad29)),
      );
}

class TextForm2 extends StatelessWidget {
  const TextForm2({
    super.key,
    required this.text,
    this.hintText,
    this.textColor,
    this.maxLines,
    this.borderRadius,
    this.textEditingController,
    this.onChanged,
  });

  final TextEditingController? textEditingController;
  final String text;
  final String? hintText;
  final Color? textColor;
  final int? maxLines;
  final BorderRadius? borderRadius;
final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF3E4B4B),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.25,
            ),
          ),
          verticalSpace(10),
          TextFormField(
            onChanged:onChanged ,
            maxLines: maxLines ?? 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return null;
            },
            controller: textEditingController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff4051ad29)),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: borderRadius ?? BorderRadius.circular(50)),
                contentPadding: const EdgeInsetsDirectional.all(15),
                hintText: hintText,
                filled: true,
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Color(0xff4051ad29)))),
          )
        ],
      );
}
