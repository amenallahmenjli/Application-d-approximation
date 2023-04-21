import 'package:flutter/material.dart';

import '../colors.dart';
import 'text_styles.dart';

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColor,
      foregroundColor: lightColor,
      titleTextStyle: appBarTextStyleDark,
      centerTitle: true,
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: darkColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: darkColor,
      secondary: secondaryColor,
      onSecondary: darkColor,
      error: errorColor,
      onError: darkColor,
      background: darkColor,
      onBackground: lightColor,
      surface: primaryColor,
      onSurface: darkColor,
    ));
