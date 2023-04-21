import 'package:approximation_app/constants/themes/text_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/themes/dark.dart';
import '../main.dart';

// ignore: must_be_immutable
class MyDropdownButton extends StatefulWidget {
  MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  // Options in the dropdownbutton
  final List<String> items = ['f(x)', 'g(g)'];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    // I used the CoolDropdown widget because it's cool?
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonStyleData: const ButtonStyleData(
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
