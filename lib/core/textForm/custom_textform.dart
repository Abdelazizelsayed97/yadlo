import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextForm extends StatelessWidget {
  TextForm(
      {super.key,
      required this.textHint,
      required this.icon,
      this.opsCureText,
      this.suffixIcon,
      required this.controller,
      required this.validator});

  final TextEditingController controller;

  final String? textHint;
  final Widget? icon;
  final bool? opsCureText;
  final Widget? suffixIcon;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        autovalidateMode: AutovalidateMode.always,
        validator: (value) {
          return validator(value);
        },
        controller: controller,
        obscureText: opsCureText ?? false,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            focusColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(50),
                gapPadding: 15),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.red)),
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
        enabled: true,
      );
}

class TextForm2 extends StatelessWidget {
  TextForm2({
    super.key,
    required this.text,
    this.hintText,
    this.textColor,
    this.maxLines,
    this.borderRadius,
  });

  final TextEditingController _textEditingController = TextEditingController();
  final String text;
  final String? hintText;
  final Color? textColor;
  final int? maxLines;
  final BorderRadius? borderRadius;

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
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            maxLines: maxLines ?? 1,
            autovalidateMode: AutovalidateMode.always,
            validator: (value) {},
            controller: _textEditingController,
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
