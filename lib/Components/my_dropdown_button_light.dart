import 'package:approximation_app/constants/themes/text_styles.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'my_dropdown_button.dart';

// ignore: must_be_immutable
class MyDropdownButtonLight extends StatelessWidget {
  MyDropdownButtonLight({
    super.key,
    required this.controller,
  });

  DropdownController controller;

  @override
  Widget build(BuildContext context) {
    // I used the CoolDropdown widget because it's cool?
    return MyDropdownButton(
      controller: controller,
      main: lightColor,
      notMain: darkColor,
      textStyle: dropdownButtonTextStyleLight,
      accent: accentLight,
    );
  }
}
