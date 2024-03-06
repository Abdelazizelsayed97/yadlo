import 'package:flutter/material.dart';
import 'package:yadlo/core/extenstions/list_ext.dart';

class GenericDropDownMenu extends StatelessWidget {
  const GenericDropDownMenu({
    super.key,
    required this.texts,
    this.hintText,
     this.onSelect,
  });

  final List<String> texts;
  final String? hintText;
  final void Function(int? selectedIndex)? onSelect;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      hintText: hintText,
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)))),
      width: double.maxFinite,
      menuStyle: MenuStyle(
          shape: MaterialStatePropertyAll(
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(9)))),
      onSelected: onSelect,
      dropdownMenuEntries: texts
          .mapIndexed(
            (text, index) => DropdownMenuEntry(label: text, value: index),
          )
          .toList(),
    );
  }
}
