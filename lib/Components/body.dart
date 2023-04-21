import 'package:approximation_app/constants/colors.dart';
import 'package:approximation_app/constants/themes/dark.dart';
import 'package:flutter/material.dart';

import 'text_input.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Body({super.key, required this.themeData});
  final ValueNotifier<ThemeData> themeData;

  TextEditingController controller = TextEditingController();

  bool isNValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextInput(
          color: themeData.value == darkTheme ? lightColor : darkColor,
          controller: controller,
          isValid: isNValid,
          text: "Saisir un entier n:",
        )
      ],
    );
  }
}
