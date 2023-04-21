import 'package:approximation_app/constants/themes/text_styles.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/themes/dark.dart';

// ignore: must_be_immutable
class MyDropdownButton extends StatelessWidget {
  MyDropdownButton({
    super.key,
    required this.controller,
    required this.main,
    required this.notMain,
    required this.textStyle,
    required this.accent,
    required this.selectedFunction,
  });

  ValueNotifier<String?> selectedFunction;

  Color main;
  Color
      notMain; // I know the name is a really bad one but I'm too exhausted to think about a name rn
  Color accent;
  TextStyle textStyle;

  DropdownController controller;

  // Options in the dropdownbutton
  List<CoolDropdownItem<String>> dropdownItemList = [
    CoolDropdownItem(label: 'Choisir une fonction', value: ''),
    CoolDropdownItem<String>(label: 'f(x)', value: 'f'),
    CoolDropdownItem<String>(label: 'g(x)', value: 'g'),
  ];

  @override
  Widget build(BuildContext context) {
    print(selectedFunction.value);
    int defaultF = 0;
    if (selectedFunction.value == "null") {
      defaultF = 0;
    } else if (selectedFunction.value == "f") {
      defaultF = 1;
    } else if (selectedFunction.value == "g") {
      defaultF = 2;
    } else {
      print("Something is wrong here");
    }

    // I used the CoolDropdown widget because it's cool?
    return CoolDropdown<String>(
      dropdownItemOptions: DropdownItemOptions(
          textStyle: textStyle,
          selectedTextStyle: dropdownButtonTextStyleSelected,
          selectedBoxDecoration: BoxDecoration(
              color: accent, borderRadius: BorderRadius.circular(5))),

      // The dropdown controller to retrieve its value
      controller: controller,

      // The list of items in the dropdown button
      dropdownList: dropdownItemList,

      // The default selected item
      defaultItem: dropdownItemList[defaultF],

      // The button itself
      resultOptions: ResultOptions(
        // Box Decoration options
        boxDecoration: BoxDecoration(
            // Border Radius
            borderRadius: BorderRadius.circular(5),

            // Border style
            border: Border.all(width: 2, color: notMain),

            // Background Color
            color: main),

        openBoxDecoration: BoxDecoration(
            // Border Radius
            borderRadius: BorderRadius.circular(5),

            // Border style
            border: Border.all(width: 2, color: notMain),

            // Background Color
            color: main),

        // Padding inside the box
        padding: const EdgeInsets.symmetric(horizontal: 10),

        // The icon on the right side
        icon: SizedBox(
          width: 10,
          height: 10,
          child: CustomPaint(
            painter: DropdownArrowPainter(color: notMain),
          ),
        ),

        // Idk what is this but let's leave it there
        isMarquee: true,

        // Text style in the button
        textStyle: textStyle,
      ),

      // The list of options that appear bellow the button
      dropdownOptions: DropdownOptions(
          // The space between the button and the options list
          top: 10,

          // The gap between options
          gap: const DropdownGap.all(5),

          // the border around the options list
          borderSide: BorderSide(
            width: 2,
            color: notMain,
          ),

          // Background Color
          color: main,

          // Border radius
          borderRadius: BorderRadius.circular(5),

          // The padding around the options
          padding: const EdgeInsets.symmetric(horizontal: 5),
          animationType: DropdownAnimationType.size),

      onChange: (value) async {
        if (controller.isError) {
          await controller.resetError();
        } else {
          print(value);
          if (value == "") {
            selectedFunction.value = "null";
          } else {
            selectedFunction.value = value;
          }
        }
      },
      onOpen: (value) {},

      // There's a triangle that appears on top of the options it's annoying so I decided to remove it
      dropdownTriangleOptions: const DropdownTriangleOptions(
        width: 100,
        height: 0.0000000001,
        align: DropdownTriangleAlign.left,
        borderRadius: 2,
        left: 20,
      ),
    );
  }
}
