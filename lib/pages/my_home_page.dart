import 'package:approximation_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/themes/dark.dart';
import '../constants/themes/light.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.themeData});
  final ValueNotifier<ThemeData> themeData;

  void switchTheme(ValueNotifier<ThemeData> themeData) {
    final ThemeData currentTheme = themeData.value;

    if (currentTheme == darkTheme) {
      themeData.value = lightTheme;
    } else {
      themeData.value = darkTheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application d'approximation"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                switchTheme(themeData);
              },
              icon: themeData.value == lightTheme
                  ? SvgPicture.asset(
                      "assets/icons/dark_mode.svg",
                      colorFilter: ColorFilter.mode(darkColor, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(
                      "assets/icons/light_mode.svg",
                      colorFilter:
                          ColorFilter.mode(lightColor, BlendMode.srcIn),
                    ))
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: grey,
              height: 1,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello World!'),
            TextButton(
                onPressed: () {
                  switchTheme(themeData);
                },
                child: Text("Turn to the darkside!"))
          ],
        ),
      ),
    );
  }
}
