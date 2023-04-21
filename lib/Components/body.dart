import 'package:approximation_app/constants/colors.dart';
import 'package:approximation_app/constants/themes/dark.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';

import 'my_dropdown_controller.dart';
import 'text_input.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({super.key, required this.themeData});
  final ValueNotifier<ThemeData> themeData;

  TextEditingController textController = TextEditingController();

  DropdownController dropdownController = DropdownController();

  bool isNValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextInput(
          color: themeData.value == darkTheme ? lightColor : darkColor,
          controller: textController,
          isValid: isNValid,
          text: "Saisir un entier n:",
        ),
        const SizedBox(
          height: 10,
        ),
        MyDropdownButton()
      ],
    );
  }
}
