import 'package:approximation_app/constants/themes/text_styles.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/themes/dark.dart';
import 'my_dropdown_button.dart';

// ignore: must_be_immutable
class MyDropdownButtonDark extends StatelessWidget {
  MyDropdownButtonDark({
    super.key,
    required this.controller,
  });

  DropdownController controller;

  // Options in the dropdownbutton
  List<CoolDropdownItem<String>> dropdownItemList = [
    CoolDropdownItem<String>(label: 'Choisir une fonction', value: 'f'),
    CoolDropdownItem<String>(label: 'f(x)', value: 'f'),
    CoolDropdownItem<String>(label: 'g(x)', value: 'g'),
  ];

  @override
  Widget build(BuildContext context) {
    Color main = darkColor;
    Color notMain =
        lightColor; // I know the name is a really bad one but I'm too exhausted to think about a name rn

    TextStyle textStyle = dropdownButtonTextStyleDark;

    // I used the CoolDropdown widget because it's cool?
    return MyDropdownButton(
      controller: controller,
      main: darkColor,
      notMain: lightColor,
      textStyle: dropdownButtonTextStyleDark,
    );
  }
}
