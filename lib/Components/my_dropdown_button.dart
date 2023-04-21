import 'package:approximation_app/constants/themes/text_styles.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/themes/dark.dart';
import '../main.dart';

// ignore: must_be_immutable
class MyDropdownButton extends StatelessWidget {
  MyDropdownButton({super.key, required this.controller});

  DropdownController controller;

  // Options in the dropdownbutton
  List<CoolDropdownItem<String>> dropdownItemList = [
    CoolDropdownItem<String>(label: 'Choisir une fonction', value: 'f'),
    CoolDropdownItem<String>(label: 'f(x)', value: 'f'),
    CoolDropdownItem<String>(label: 'g(x)', value: 'g'),
  ];

  @override
  Widget build(BuildContext context) {
    // I used the CoolDropdown widget because it's cool?
    return CoolDropdown<String>(
      // The dropdown controller to retrieve its value
      controller: controller,

      // The list of items in the dropdown button
      dropdownList: dropdownItemList,

      // The default selected item
      defaultItem: dropdownItemList[0],

      // The button itself
      resultOptions: ResultOptions(
        // Box Decoration options
        boxDecoration: BoxDecoration(
          // Border Radius
          borderRadius: BorderRadius.circular(5),

          // Border style
          border: Border.all(
            width: 2,
            color: themeData.value == darkTheme ? lightColor : darkColor,
          ),

          // Background Color
          color: themeData.value == darkTheme ? darkColor : lightColor,
        ),

        // Padding inside the box
        padding: const EdgeInsets.symmetric(horizontal: 10),

        // The icon on the right side
        icon: SizedBox(
          width: 10,
          height: 10,
          child: CustomPaint(
            painter: DropdownArrowPainter(
              color: themeData.value == darkTheme ? lightColor : darkColor,
            ),
          ),
        ),

        placeholder: 'Select Fruit',
        isMarquee: true,
        textStyle: themeData.value == darkTheme
            ? dropdownButtonTextStyleDark
            : dropdownButtonTextStyleLight,
      ),

      onChange: (value) async {
        if (controller.isError) {
          await controller.resetError();
        }
      },
      onOpen: (value) {},

      dropdownOptions: DropdownOptions(
          top: 20,
          gap: const DropdownGap.all(5),
          borderSide: BorderSide(
            width: 1,
            color: themeData.value == darkTheme ? lightColor : darkColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          align: DropdownAlign.left,
          animationType: DropdownAnimationType.size),
      dropdownTriangleOptions: const DropdownTriangleOptions(
        width: 100,
        height: 0.0000000001,
        align: DropdownTriangleAlign.left,
        borderRadius: 2,
        left: 20,
      ),
      dropdownItemOptions: DropdownItemOptions(
        selectedBoxDecoration: BoxDecoration(color: Colors.amber),
        textStyle: themeData.value == darkTheme
            ? dropdownButtonTextStyleLight
            : dropdownButtonTextStyleDark,
        isMarquee: true,
        mainAxisAlignment: MainAxisAlignment.start,
        render: DropdownItemRender.all,
        height: 35,
      ),
    );
  }
}
