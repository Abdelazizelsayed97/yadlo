import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cache/colors/colors.dart';

class DropDownTextForm extends StatelessWidget {
  DropDownTextForm({
    super.key,
    required this.text,
    required this.text2,
    required this.hint,
  });

  final String text;
  final String text2;
  final Widget hint;

  @override
  Widget build(BuildContext context) {
    var value = '-1';
    return DropdownButtonFormField(
      focusNode: FocusNode(),
      isDense: true,
      autovalidateMode: AutovalidateMode.always,
      value: value,
      menuMaxHeight: 150.h,
      itemHeight: 50.h,
      dropdownColor: Colors.white,
      isExpanded: false,
      hint: hint,
      borderRadius: BorderRadius.circular(50),
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.all(15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: ColorsManger.lowGrey)),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.black,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedErrorBorder: InputBorder.none,
        enabled: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: ColorsManger.lowGrey)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManger.lowGrey),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevation: 1,
      focusColor: Colors.black,
      items: [
        DropdownMenuItem(
          onTap: () {
            if (value == -1) {}
          },
          enabled: true,
          value: '-1',
          alignment: Alignment.center,
          child: const Text(
            'Tech',
            style: TextStyle(
              color: Color(0x9B0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DropdownMenuItem(
          value: '1',
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0x9B0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DropdownMenuItem(
          value: '2',
          alignment: Alignment.center,
          child: Text(
            text2,
            style: const TextStyle(
              color: Color(0x9B0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ],
      onChanged: (dynamic) {},
    );
  }
}


class DropDownTextForm2 extends StatefulWidget {
  const DropDownTextForm2({
    Key? key,
    required this.text,
    required this.text2,
    required this.hint,
  }) : super(key: key);

  final String text;
  final String text2;
  final Widget hint;

  @override
  _DropDownTextForm2State createState() => _DropDownTextForm2State();
}

class _DropDownTextForm2State extends State<DropDownTextForm2> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      onChanged: (newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      dropdownColor: Colors.white,
      isExpanded: false,
      hint: widget.hint,
      borderRadius: BorderRadius.circular(50),
      elevation: 1,
      itemHeight: 50,
      menuMaxHeight: 150,
      focusColor: Colors.black,
      items: [
        DropdownMenuItem<String>(
          value: '-1',
          child: const Text(
            'Tech',
            style: TextStyle(
              color: Color(0xFF0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: '1',
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Color(0xFF0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: '2',
          child: Text(
            widget.text2,
            style: const TextStyle(
              color: Color(0xFF0B1A51),
              fontSize: 13,
              fontFamily: 'Somar Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

