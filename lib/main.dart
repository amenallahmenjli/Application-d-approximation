import 'package:flutter/material.dart';

import 'constants/themes/dark.dart';
import 'constants/themes/light.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(const MainApp());
}

ValueNotifier<ThemeData> themeData = ValueNotifier<ThemeData>(lightTheme);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeData,
        builder: (context, ThemeData theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData.value,
            home: MyHomePage(
              themeData: themeData,
            ),
          );
        });
  }
}
