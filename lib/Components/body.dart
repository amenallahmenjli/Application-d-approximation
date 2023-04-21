import 'package:approximation_app/constants/colors.dart';
import 'package:approximation_app/constants/themes/dark.dart';
import 'package:approximation_app/constants/themes/light.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';

import 'my_dropdown_button_dark.dart';
import 'my_dropdown_button_light.dart';
import 'text_input.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body(
      {super.key,
      required this.themeData,
      required this.textController,
      required this.selectedFunction});
  final ValueNotifier<ThemeData> themeData;
  final TextEditingController textController;
  ValueNotifier<String?> selectedFunction;

  DropdownController dropdownController = DropdownController();

  bool isNValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text Input Widget
        TextInput(
          color: themeData.value == darkTheme ? lightColor : darkColor,
          controller: textController,
          isValid: isNValid,
          text: "Saisir un entier n:",
        ),

        // Some Space
        const SizedBox(
          height: 10,
        ),

        // Dropdown Button Widget
        themeData.value == lightTheme
            ? MyDropdownButtonLight(
                controller: dropdownController,
                selectedFunction: selectedFunction,
              )
            : MyDropdownButtonDark(
                controller: dropdownController,
                selectedFunction: selectedFunction,
              ),

        // Some Space
        const SizedBox(
          height: 10,
        ),

        Text(textController.text),

        Text(selectedFunction.value ?? "null"),
      ],
    );
  }
}
